#!/usr/bin/env perl
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE":
# <aldis@bsdroot.lv> wrote this file. As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return. Aldis Berjoza
# ----------------------------------------------------------------------------

package FreeBSD_syscalls4fasm;

use warnings;
use strict;

my $version = "1.0.5";

my $masterfile;

if (defined $ARGV[0]) {
	$masterfile = $ARGV[0];
} else {
	$masterfile = "/usr/src/sys/kern/syscalls.master";
}

open(MF, "<", $masterfile) or die "ERR: can't open '$masterfile' for reading\n";

my $join_lines = 0;
my $full_line = "";

my $syscall_type = "STD";
my $syscall_current_type = "STD";

while (my $line = <MF>) {
	chomp($line);			# remove newline
	$line =~ s/[ \t]+$//;	# strip white space, if any

	if ($line =~ m/^\d+/) {

		if ($line =~ m/(STD|COMPAT\d*|LIBCOMPAT|NOSTD)/) {
			$syscall_current_type = "$1";
		} else {
			$syscall_current_type = "STD";
		}

		unless ("$syscall_current_type" eq "$syscall_type") {
			print "end if\n" unless ($syscall_type eq "STD");
			print "if defined ${syscall_current_type}\n" unless ($syscall_current_type eq "STD");
			$syscall_type = "$syscall_current_type";
		}
	}

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
	} elsif ($line =~ m/^\d+/) {
		if ($line =~ m/\d+[ \t]+\w+[ \t]+\w+[ \t]+\w+/) {
			my ($number, $type, $name) = $line =~ m/(\d+)[ \t]+\w+[ \t]+(\w+)[ \t]+(\w+)/;
			$name =~ tr/[a-z]/[A-Z]/;
			my $prefix ="SYS_";
			$prefix = "" if ($name =~ /^SYS_/);
			printf "\t%-30s = $number ; $type\n", ";" . $prefix . $name;
		} else {
			print "\t;$line\n";
		}

	} else {
		if ($line =~ m/^[ \t]*;/ or $line =~ m/^$/) {	# check if line is commented
			print "$line\n";
		} else {
			print "; $line\n";	# add comment if nessacery
		}
	}
}
close(MF);

print "\n\n;==============================================\n";
print "; Converted with FreeBSD_syscalls4fasm.pl v$version\n";
print "; http://aldis.git.bsdroot.lv/asm4BSD/\n\n";
print "; vim: set ts=8 sw=8 syn=fasm:\n";

exit;

sub process_syscall_line() {
	my $pline = $_[0];
	my ($number, $type, $name, $comment);
	my $prefix = "SYS_";
	
	($number, $type, $comment, $name) = ($pline =~ m/^(\d+) \w+ (\w+).+\{ (.* \*??(\w+) ??\(.*\);) ??\}/);
	$name =~ tr/[a-z]/[A-Z]/;
	
	$prefix = "" if ($name =~ /^SYS_/);
	$prefix = ";" . $prefix if ($name =~ /nosys/i);
	printf "\t%-30s = $number ; $comment\n", $prefix . $name;

	die "ERR: seams like regex needs improvement\n" unless $name;
}

# vim: set ts=4 sw=4:
