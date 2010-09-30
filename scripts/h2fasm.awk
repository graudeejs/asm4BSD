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
	
	DEBUG=0
}

/\/\*/ && /\*\// {
	gsub(/\/\*.*\*\//, "")
}

PRINT_STRUCTURES == 1 && /struct/,/}/ {
	gsub(/};/, "}")
	sub(/;/, " ")	# replacing with space to preserver formating
	DO_PRINT=1
}


/#define[ \t]*[A-Z0-9_]*/ && PRINT_DEFINITIONS == 1 {	# assume all constants use capitals
	$2=$2"=\t"
	$1=""
	DO_PRINT=1
}

/#ifdef/ && PRINT_IFS == 1 {
	$1="if defined"
	DO_PRINT=1
}

/#ifndef/ && PRINT_IFS == 1 {
	$1="if not defined"
	DO_PRINT=1
}

/#if/ && PRINT_IFS == 1 {
	gsub(/\|\|/, "or")
	gsub(/\&\&/, "and")
	gsub(/!/, "not ")
	$1="if"
	DO_PRINT=1
}

/#endif/ && PRINT_IFS == 1 {
	$1="end if"
	DO_PRINT=1
}

/#elif/ && PRINT_IFS == 1 {
	$1="else if"
	DO_PRINT=1
}

/#else/ && PRINT_IFS == 1 {
	$1="else"
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
	print "\n;"
	print ";=========================================="
	print "; Converted with h2fasm.awk script"
	print "; http://aldis.git.bsdroot.lv/asm4FreeBSD/ "
	print ";"
}