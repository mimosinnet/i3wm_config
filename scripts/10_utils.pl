#!/usr/bin/env perl 
# Info {{{
# define applications for workspace #10: utils
# }}}

# Use {{{
use strict;
use warnings;
use v5.20;
# }}}

# Variables {{{
my @args;
# }}}

@args = qw/urxvtc/;
system(@args) == 0 or die "unable to execute @arges because of $!";
