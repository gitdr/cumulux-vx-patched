#!/bin/sh

[ "$1" = "start" ] || exit 0

. /lib/init/vars.sh
. /lib/lsb/init-functions

log_action_msg "   Renaming eth interfaces to swp"
interfaces=`ip link show | sed -n 's/.*\(eth[2-9]\|eth[1-9][0-9]\+\):.*/\1/p'`
for i in $interfaces ; do
    num=`echo $i | sed -n 's/.*eth\(.*\).*/\1/p'`
    ip link set eth$num name "swp$(($num - 1))"
done
