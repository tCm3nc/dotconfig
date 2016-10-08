#!/bin/bash
#
# execute external commands in i3status

i3status | (read line && echo $line && read line && echo $line && while :
do
    read line
    vars=`echo -e "$([[ -z $(mpc current) ]] && echo -e "" || echo -e "  $(mpc current)|")   $(free -m | awk '/Mem/ {print $3}')Mb"`
    text="[{ \"full_text\": \"${vars}\" },"
    echo "${line/[/$text}" || exit 1
done)
