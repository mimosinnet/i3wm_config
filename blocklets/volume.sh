#!/bin/bash - 
# i3blocks alsamixer set volume 

set -o nounset                              # Treat unset variables as an error

case $BLOCK_BUTTON in
	1) (amixer -c 1 get Master | grep -q off && amixer -qc 1 set Master unmute) || amixer -qc 1 set Master mute;;
	4) amixer -qc 1 set Master 5%+;;	# Scroll Up
	5) amixer -qc 1 set Master 5%-;;	# Scroll Down
esac

if (amixer -c 1 get Master | grep -q off)
then
		color="#FF0000"
else
		color="#07FFFF"
fi

vol=`/usr/local/libexec/i3blocks/volume`
echo "$vol

$color"

