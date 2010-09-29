#!/usr/bin/perl

# Copyright (c) 2010, Aldis Berjoza <aldis@bsdroot.lv>
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# * Redistributions of source code must retain the above copyright
#   notice, this list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above
#   copyright notice, this list of conditions and the following disclaimer
#   in the documentation and/or other materials provided with the
#   distribution.
# * Neither the name of the  nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# It's ugly down there :D

package defs;

use warnings;
use strict;

die "ERR: No file select to analyze\n" unless( defined $ARGV[0]);

	open (FIN, '<', $ARGV[0]) or die "ERR: Can't open file " . $ARGV[0] . "for writing\n";
#	open (FOUT, '>>', $ARGV[0] . ".fasm") or die "ERR: Can't open file " . $ARGV[0] . "for writing\n";

	while (my $line = <FIN>) {
		$line =~ s/\#[ \t]*define[ \t]*([a-zA-Z0-9_]*)/$1\tequ/;
		$line =~ s/([a-zA-Z0-9_]*[ \t]*equ)[ \t]*$/$1 1/;
		$line =~ s/\#[ \t]*include[ \t]*[<"]([a-zA-Z0-9_\/\.]*)[>"]/include "$1"/;
		$line =~ s#/\*(.*) \*/#; $1#;
		$line =~ s/#[ \t]*ifdef/if defined/;
		$line =~ s/#[ \t]*ifndef/if not defined/;
		$line =~ s/#[ \t]*(if|else)/$1/;
		$line =~ s/#[ \t]*endif/end if/;
		$line =~ s/;[ \t]*/; /;
		$line =~ s#//#;#;

		print "$line";
	}
	close FIN;
#	close FOUT;


# vim: set ts=4 sw=4:
