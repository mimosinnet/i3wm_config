#!/bin/bash - 
# Define applications for workspace #10: utils
# https://github.com/fhaun/config-misc/blob/master/i3-stuff/auto-start-for-i3

set -o nounset                              # Treat unset variables as an error

# DOC
# ==========
# Simple autostart file for i3-wm, you can execute it from i3 config
# file. Put this at the end:
# exec $HOME/bin/auto-start-for-i3
#
# xdotool and xmessage must be installed. On BSD use jot instead of
# seq or install seq from ports.
#
# Building this layout
# ____________________________________
# |             |                    |
# |             | ding               |
# |             |--------------------|
# | emacs       |-STACK chromium    -|
# |             |-STACK emacs-frame -|
# |             |-STACK pdf         -|
# |             |                    |
# |             |                    |
# |             |                    |
# |-------------|                    |
# |             |                    |
# | terminal    |                    |
# |_____________|____________________|
#
# Building a layout on another workspace switch to it with:
# i3-msg Workspace 2
#
#
# It may be usefull to disable mouse pointer and/or touchpad while
# layouting.
#
# Disable mouse:
# mouseID=`xinput list | grep -Eo 'Mouse\s.*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
# xinput set-prop $mouseID "Device Enabled" 0
#
# Enable mouse:
# xinput set-prop $mouseID "Device Enabled" 1
#
# Disable the touchpad:
# touchID=`xinput list | grep -Eo 'TouchPad\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
# xinput set-prop $touchID "Device Enabled" 0
#
# Enable the touchpad
# xinput set-prop $touchID "Device Enabled" 1
#
#
# Another solution how to disable/enable
# https://github.com/deterenkelt/dotfiles/blob/master/.i3/autostart.sh


# CODE
# ==========

# Max seconds to wait until the process is up
MAXWAIT=30

# Start the given command and wait until it's visible
StartProg()
{
    "$@" &                  # Handle arguments with whitspaces
    mypid=$!                # Pid of last background process
    for i in `seq $MAXWAIT` # count from 1 to MAXWAIT
    do
    	if xdotool search --onlyvisible --pid $mypid; then
    	    return 0
    	fi
	sleep 1
    done
    xmessage "Error on executing: $@" &
}


### --- emacs --- ###
# StartProg conky
# sleep 2

### --- ding ---- ###
StartProg urxvtc
sleep 2

# make right bigger
i3-msg resize grow left 90 px or 90 ppt

exit 0


