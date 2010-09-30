#!/usr/bin/perl
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE":
# <aldis@bsdroot.lv> wrote this file. As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return. Aldis Berjoza
# ----------------------------------------------------------------------------

package syscalls;

use warnings;
use strict;

my $version = "1.0";

my $masterfile = "/usr/src/sys/kern/syscalls.master";

open(MF, "<", $masterfile) or die "ERR: can't open '$masterfile' for reading\n";


my $join_lines = 0;
my $full_line = "";

while (my $line = <MF>) {
	chomp($line);			# remove newline
	$line =~ s/[ \t]+$//;	# strip white space, if any


	if ($line =~ m/^\d+[ \t].*\{.*/ or $join_lines == 1) {	# lines we're interested start with syscall number

		$line =~ s/\t+/ /g;
		$line =~ s/ +/ /g;
		$line =~ s/^[ \t]+//;

		if ($line =~ m/\\$/) {
			$join_lines = 1;
			$line =~ s/\\$//;
			$full_line .= $line;
		} elsif ($join_lines == 1) {
			$line =~ s/\\$//;
			$join_lines = 0;
			&process_syscall_line($full_line . $line);
			$full_line = "";
		} else {
			$join_lines = 0;
			&process_syscall_line($line);
		}
#	} elsif ($line =~ m/^;??[ \t]*\d+/) {
	} elsif ($line =~ m/^\d+/) {
		my ($number, $type, $name) = $line =~ m/(\d+)[ \t]+\w+[ \t]+(\w+)[ \t]+(\w+)/;
		$name =~ tr/[a-z]/[A-Z]/;
		print "\t;SYS_$name\t= $number ; $type\n";
	} else {
		if ($line =~ m/^[ \t]*;/ or $line =~ m/^$/) {	# check if line is commented
			print "$line\n";
		} else {
			print "; $line\n";	# add comment if nessacery
		}
	}

}

print "\n\n;==============================================\n";
print "; Converted with FreeBSD_syscalls4fasm.pl v$version\n";
print "; http://aldis.git.bsdroot.lv/asm4FreeBSD/\n\n";
print "; vim: set ts=8 sw=8 syn=fasm:\n";

close(MF);
exit;

sub process_syscall_line() {
	my $pline = $_[0];
	my ($number, $type, $name, $comment);
	
	($number, $type, $comment, $name) = ($pline =~ m/^(\d+) \w+ (\w+).+\{ (.* (\w+) ??\(.*\);) ??\}/);
	$name =~ tr/[a-z]/[A-Z]/;

	print "\tSYS_$name\t= $number ; $comment\n";

	die "ERR: seams like regex needs improvement\n" unless $name;

}

# vim: set ts=4 sw=4:
