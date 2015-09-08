#!/bin/bash - 
#===============================================================================
#
# Using bash-support.vim: http://www.vim.org/scripts/script.php?script_id=365
# 
#          FILE:  top.sh
# 
#         USAGE:  ./top.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Mimosinnet (JPT), mimosinnet@ningunlugar.org
#       COMPANY: NingúnLugar
#       CREATED: 13/04/15 15:24:07 CEST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

ps -A --format comm:7,%cpu:1,%mem:1 --sort -%cpu  | head -2
