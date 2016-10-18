#!/usr/bin/env perl6
# {{{ Use
use v6;
# }}}

sub MAIN (Str $file) {
	my $command = "convert -verbose -density 150 -trim $file.pdf -quality 100 -flatten -sharpen 0x1.0 $file.jpg";
	shell($command);
}
