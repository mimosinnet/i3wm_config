#!/bin/bash

W10="10: Utils"

urxvtc --title 'i3-Console'
i3-msg move container to workspace $W10
i3-msg workspace $W10
i3-msg resize grow width 44 px or 44 ppt
