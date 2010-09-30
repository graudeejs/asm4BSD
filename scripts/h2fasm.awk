# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE":
# <aldis@bsdroot.lv> wrote this file. As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return. Aldis Berjoza
# ----------------------------------------------------------------------------

BEGIN {
	PRINT_MCOMMENTS=1	# print multiline comments
	PRINT_COMMENTS=1	# print signle line comments
	PRINT_STRUCTURES=1	# print structures (needs manual editing)
	PRINT_DEFINITIONS=1	# print CONSTANTS
	PRINT_IFS=1		# print if, else etc
	PRINT_EMTPY_LINES=1	# print empty lines (exept in structures)
	PRINT_INCLUDES=1	# print which files are included form this header
	PRINT_ENUM=1		# print enums
	
	DEBUG=0
}

PRINT_STRUCTURES == 1 && /struct/,/}/ {
	gsub(/};/, "}")
	sub(/;/, " ")	# replacing with space to preserver formating
	DO_PRINT=1
}

PRINT_ENUM == 1 && /enum/,/}/ {
	gsub(/};/, "}")
	sub(/;/, " ")	# replacing with space to preserver formating
	DO_PRINT=1
}

PRINT_COMMENTS = 0 && /\/\*/ && /\*\// {
	gsub(/\/\*.*\*\//, "")
}

PRINT_COMMENTS = 1 && /\/\*/ && /\*\// {
	gsub(/\/\*/, ";")
	gsub(/[ \t]*\*\/[ \t]*$/, "")
}

PRINT_DEFINITIONS == 1 && /#define[ \t]*[A-Z0-9_]*/ {	# assume all constants use capitals
	$2=$2"=\t"
	$1="	"
	DO_PRINT=1
}

PRINT_IFS == 1 && /#ifdef/ {
	$1="if defined"
	DO_PRINT=1
}

PRINT_IFS == 1 && /#ifndef/ {
	$1="if not defined"
	DO_PRINT=1
}

PRINT_IFS == 1 && /#if/ {
	gsub(/\|\|/, "or")
	gsub(/\&\&/, "and")
	gsub(/!/, "not ")
	$1="if"
	DO_PRINT=1
}

PRINT_IFS == 1 && /#endif/ {
	$1="end if"
	DO_PRINT=1
}

PRINT_IFS == 1 && /#elif/ {
	$1="else if"
	DO_PRINT=1
}

PRINT_IFS == 1 && /#else/ {
	$1="else"
	DO_PRINT=1
}

PRINT_INCLUDES == 1 && /#include/ {
	$1=";include"
	DO_PRINT=1
}

/\\$/ && DO_PRINT == 1 {
	PRINT_NEXT_LINE=1
}

PRINT_EMTPY_LINES == 1 && /^$/ {
	DO_PRINT=1
}

PRINT_MCOMMENTS == 1 && /\/\*[\-\*]??/,/\*\// {	# multi line comments
	$1=";"
	DO_PRINT=1
}


DO_PRINT == 0 && DEBUG == 1 {	# show what we will not print
	$1=";!"$1
	DO_PRINT=1
}


DO_PRINT == 1 {
	print $0
	DO_PRINT=PRINT_NEXT_LINE
	PRINT_NEXT_LINE=0
}

END {
	print "\n;=========================================="
	print "; Converted with h2fasm.awk script"
	print "; http://aldis.git.bsdroot.lv/asm4FreeBSD/ "
	print ";\n"
	print "; vim: set ts=8 sw=8 syn=fasm:"

}
