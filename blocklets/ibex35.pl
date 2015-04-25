#!/usr/bin/env perl 
#  DESCRIPTION: Extract ibex35 info

# {{{ Use
use strict;
use warnings;
use 5.020;
use LWP::UserAgent;
use FindBin qw($Bin);
use lib "$Bin/lib";
use Message;
use Colors;
# }}}

# {{{ Var
my ($lower_value, $upper_value) = (-1,1);
# }}}

# Get color code, lower_value, upper_value, value
my $color_code = get_color_code($lower_value,$upper_value,$ibex_dif);

# Message {{{
say $message;
say "";
say $color_code;
# }}}


