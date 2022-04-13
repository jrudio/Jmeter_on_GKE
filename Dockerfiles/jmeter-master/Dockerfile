FROM jrudio/jmeter-base:v1

LABEL maintainer=jrudio

ARG JMETER_INFLUXDB_PLUGIN_VERSION=1.5
ARG JMETER_INFLUXDB_PLUGIN_URL=https://github.com/mderevyankoaqa/jmeter-influxdb2-listener-plugin/releases/download/v${JMETER_INFLUXDB_PLUGIN_VERSION}/jmeter-plugin-influxdb2-listener-${JMETER_INFLUXDB_PLUGIN_VERSION}-all.jar

ARG VNC_SET_PASSWORD_SCRIPT=set-vnc-password.sh
ARG VNC_SET_PASSWORD_SCRIPT2=vnc-config.sh
ARG DIR=/root/
ARG VNC_SET_PASSWORD_PATH=${DIR}${VNC_SET_PASSWORD_SCRIPT}
ARG VNC_SET_PASSWORD_PATH2=${DIR}${VNC_SET_PASSWORD_SCRIPT2}
# use --build-args to pass a password to this image
# please note this is bad practice, but we need to do it for now
ARG VNC_DEFAULT_PASSWORD="abc123"

EXPOSE 60000

# Add vncviewer and it's dependencies: 'xfce4' 'xfce4-goodies'
# 'DEBIAN_FRONTEND=noninteractive' bypasses the keyboard prompt from xfce
# 'expect' is used to script input for vncserver password
RUN apt-get update && apt-get -qy install tightvncserver dbus-x11 expect
RUN apt-get update && apt-get -qy install expect
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install xfce4 xfce4-goodies

# vncserver startup stuff
RUN touch /root/.Xresources

COPY ./${VNC_SET_PASSWORD_SCRIPT} ${VNC_SET_PASSWORD_PATH}
COPY ./${VNC_SET_PASSWORD_SCRIPT2} ${VNC_SET_PASSWORD_PATH2}

RUN chmod +x ${VNC_SET_PASSWORD_PATH}
RUN chmod +x ${VNC_SET_PASSWORD_PATH2}

RUN ${VNC_SET_PASSWORD_PATH} ${DIR} ${VNC_DEFAULT_PASSWORD}
# end vncserver startup stuff

# Download JMeter plugin listener for InfluxDB
RUN cd ${JMETER_HOME}/lib/ext && wget $JMETER_INFLUXDB_PLUGIN_URL