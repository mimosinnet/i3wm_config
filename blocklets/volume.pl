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
my (@mute, $muted, $env);
$env = $ENV{'BLOCK_BUTTON'} or $env = 0;
my $color = "#07FFFF";
my $raise = "";
$raise = $ARGV[0] if scalar @ARGV == 1;

my $master   = `amixer -c 1 get Master`;
# }}}

if ( $env == 1 or $raise eq "mute" ) {
	$master =~ /\[on\]/  and @mute = qw/amixer -qc 1 set Master mute/;
	$master =~ /\[off\]/ and @mute = qw/amixer -qc 1 set Master unmute/;
} elsif ( $raise eq "up" ) {
	@mute = qw/amixer -qc 1 set Master 5%+/;
} elsif ( $raise eq "down" ) {
	@mute = qw/amixer -qc 1 set Master 5%-/;
} 

system(@mute) == 0 or die if scalar @mute > 1;

$master   = `amixer -c 1 get Master`;
my ($volume) = ( $master =~ m/(\d+)%/ );
# Get color code, lower_value, upper_value, value
$color = get_color_code(0,100,$volume);
$color = "#FF0000" if $master =~ /\[off\]/;

say "♪ $volume";
say "";
say $color;

