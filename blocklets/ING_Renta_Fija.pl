#!/usr/bin/env perl 
#  DESCRIPTION: Extract ibex35 info

# {{{ Use
use strict;
use warnings;
use 5.020;
use LWP::UserAgent;
use FindBin qw($Bin);
use lib "$Bin/lib";
use Get_String;
use Colors;
use Data::Dumper;
# }}}

# {{{ Var
my ($lower_value, $upper_value) = (-0.5,0.5);
# }}}

my $url 	= 'http://www.morningstar.es/es/funds/snapshot/snapshot.aspx?id=F0GBR06Q1R';

my ($message, $variacion) = get_string($url);

# Get color code, lower_value, upper_value, value
my $color_code = get_color_code($lower_value,$upper_value,$variacion);

# Message {{{
say $message;
say "";
say $color_code;
# }}}


