#!/usr/bin/env perl 
#  DESCRIPTION: Extract ibex35 info

# {{{ Use
use strict;
use warnings;
use 5.020;
use LWP::UserAgent;
use FindBin qw($Bin);
use lib "$Bin/lib";
use Bolsa_Economista;
use Colors;
use Data::Dumper;
# }}}

# {{{ Var
my ($lower_value, $upper_value) = (-1,1);
# }}}

my $url 	= 'http://www.eleconomista.es/interstitial/volver/240878542/indice/S-P-500/estadistica';
my ($message, $variacion) = get_index($url);

# Get color code, lower_value, upper_value, value
my $color_code = get_color_code($lower_value,$upper_value,$variacion);

# Message {{{
say $message;
say "";
say $color_code;
# }}}


