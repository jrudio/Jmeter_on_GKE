#! /bin/bash
#
# starts vncserver if not already started
#
USER="root"
VNC_WORKDIR="/root/.vnc"

# check if vncserver is already started
#
# $1 is process name which should be Xtightvnc
# $2 is vncserver pid
# $9 is the vncserver port number but as "*:5902" or "*:x11-2"
VNC_PROCESSES=$(lsof | grep 'Xtightvnc.*TCP' | awk '{print $1, $2, $9}')
if (( echo $VNC_PROCESSES | wc -l > )); then
    echo "vncserver already started"
    exit 0
fi