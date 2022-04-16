#! /bin/bash
#
# starts vncserver if not already started
#
USER="root"
VNC_WORKDIR="/root/.vnc"

# check if vncserver is already started
#
VNC_PROCESSES=""
VNC_IS_STARTED=0
VNC_PROCESSES_COUNT=0

getVNCProcesses() {
    # awk
    #
    # $1 is process name which should be Xtightvnc
    # $2 is vncserver pid
    # $9 is the vncserver port number but as "*:5902" or "*:x11-2"
    VNC_PROCESSES=$(lsof | grep 'Xtightvnc.*TCP' | awk '{print $1, $2, $9}')
    VNC_PROCESSES_COUNT=$(echo $VNC_PROCESSES | wc -l)
}

isVNCStarted() {
    getVNCProcesses
    echo "process count: $VNC_PROCESSES_COUNT"
    if (( $VNC_PROCESSES_COUNT > 0)); then
        VNC_IS_STARTED=1
    fi
}

# start program flow
#
isVNCStarted

if (( $VNC_IS_STARTED < 1 )); then
    echo "starting vncserver..."
    USER=$USER vncserver

    isVNCStarted

    if (( $VNC_IS_STARTED < 1)); then
        echo "vncserver could not be started. Aborting..."
    else
        echo "vncserver has started"
    fi
else
    echo "vncserver already started"
fi