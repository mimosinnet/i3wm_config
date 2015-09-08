#!/usr/bin/env perl
# i3blocks alsamixer set volume 

# use {{{
use strict;
use warnings;
use 5.020;
use FindBin qw($Bin);
use lib "$Bin/lib";
use Colors;
# }}}

# vars {{{
my $card = 0;
my @mute = ("amixer","-q","-c",$card,"set","Master");
my $env;
$env = $ENV{'BLOCK_BUTTON'} or $env = 0;
my $color = "#07FFFF";
my $raise = "";
$raise = $ARGV[0] if scalar @ARGV == 1;

my $master   = `amixer -c 0 get Master`;
# }}}

if ( $env == 1 or $raise eq "mute" ) {
	$master =~ /\[on\]/  and push @mute, "mute";
	$master =~ /\[off\]/ and push @mute, "unmute";
} elsif ( $env == 4 or $raise eq "up" ) {
	push @mute, "5%+";
} elsif ( $env == 5 or $raise eq "down" ) {
	push @mute, "5%-";
} 

system(@mute) == 0 or die if scalar @mute == 7;

$master   = `amixer -c 0 get Master`;
my ($volume) = ( $master =~ m/(\d+)%/ );
# Get color code, lower_value, upper_value, value
$color = get_color_code(0,110,$volume);
$color = "#FF0000" if $master =~ /\[off\]/;

say "♪ $volume";
say "";
say $color;

