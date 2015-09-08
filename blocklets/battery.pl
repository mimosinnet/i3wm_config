#!/usr/bin/env perl
# i3blocks battery

# use {{{
use strict;
use warnings;
use 5.020;
use FindBin qw($Bin);
use lib "$Bin/lib";
use Colors;
# }}}

# vars {{{
my $remaining;
my $message = "";
my $acpi = `acpi -b`;
my ($battery) = ( $acpi =~ m/(\d+)%/ );

($remaining) = ( $acpi =~ m/(\d{2}:\d{2}:\d{2})/ ) or $remaining = "";

$message = "⌼ $battery% $remaining |" if $battery < 100;
my $color = get_color_code(0,100,$battery);
# }}}

say $message;
say "";
say $color;

