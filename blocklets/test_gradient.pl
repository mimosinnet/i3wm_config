#!/usr/bin/env perl 
# Info {{{
#===============================================================================
#
#         FILE: test_gradient.pl
#
#        USAGE: ./test_gradient.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: mimosinnet (), 
# ORGANIZATION: Associació Cultural Ningún Lugar
#      VERSION: 1.0
#      CREATED: 16/04/15 15:14:20
#     REVISION: ---
#===============================================================================
# }}}

# Use {{{
use strict;
use warnings;
use utf8;
use v5.20;
# }}}

# my $test = -0.65;

my $lower_value = -1;
my $upper_value =  1;
my $test = -0.8;


my $color_code = color($lower_value, $upper_value, $test);

say "\n$color_code";


sub color {
	my ($lower_value, $upper_value, $test) = @_;
	my ($i, $array_element, $color_code)  = ($upper_value, 0, "#FF0000");

	# Color codes, from: http://www.strangeplanet.fr/work/gradient-generator/index.php
	my @gradient = ("#00FF00","#0CF200","#19E500","#26D800","#33CC00","#3FBF00","#4CB200","#59A500","#669900","#728C00","#7F7F00","#8C7200","#996600","#A55900","#B24C00","#BF3F00","#CC3200","#D82600","#E51900","#F20C00","#FF0000");

	my $increment = ( $upper_value - $lower_value ) / scalar @gradient;
	say $increment; 

	while ($i >= $lower_value ) {
		if ( $test >  $upper_value ) { $color_code = $gradient[0]; last }
		if ( $test <= $lower_value ) { $color_code = $gradient[scalar @gradient -1]; last };

		if ( $test >= ($i - $increment) and $test < $i ) {
			$color_code = $gradient[$array_element];
			last;
		}
		say "$array_element $i $gradient[$array_element]";

		$i = $i - $increment;
		$array_element++;
	}
	return $color_code;
}


