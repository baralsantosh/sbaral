#!/bin/bash
#

address="192.168.8.2"
interface="eth0"

ip=$(ifconfig -a $interface | awk -F: '/inet/ {print $2}' | head -n 1 | awk '{print $1}')
if [ ${ip} != ${address}  ]; then

export DISPLAY=:0.0
actualusr=$( ps --no-heading -fC x-session-manager | awk 'BEGIN{ FS=" " } { print $1 }' )
xsetonoff="/usr/bin/xset"

if ( /bin/su -c "$xsetonoff -q | grep 'Monitor is Off' > /dev/null" $actualusr ) ; then /bin/sleep 30
        if ( /bin/su -c "$xsetonoff -q | grep 'Monitor is Off' > /dev/null" $actualusr ); then
                /bin/su -c "$xsetonoff dpms force on && $xsetonoff -display $DISPLAY s activate" $actualusr
                /bin/su -c "/usr/bin/gnome-session-save --shutdown-dialog" $actualusr; fi; fi

unset DISPLAY

fi

exit 0
