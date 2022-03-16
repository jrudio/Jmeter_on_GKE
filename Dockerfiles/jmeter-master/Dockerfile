FROM jrudio/jmeter-base:v0.0.1

LABEL maintainer=jrudio

ARG JMETER_INFLUXDB_PLUGIN_VERSION=1.5
ARG JMETER_INFLUXDB_PLUGIN_URL=https://github.com/mderevyankoaqa/jmeter-influxdb2-listener-plugin/releases/download/v${JMETER_INFLUXDB_PLUGIN_VERSION}/jmeter-plugin-influxdb2-listener-${JMETER_INFLUXDB_PLUGIN_VERSION}-all.jar

EXPOSE 60000

# Add vncviewer and xfce4
# bypass the keyboard prompt from xfce
RUN apt-get update && apt-get -qy install tightvncserver dbus-x11
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install xfce4 xfce4-goodies

# Download JMeter pluging listener for InfluxDB
RUN wget $JMETER_INFLUXDB_PLUGIN_URL -o ${JMETER_HOME}/lib/ext/jmeter-plugin-influxdb2-listener-${JMETER_INFLUXDB_PLUGIN_VERSION}-all.jar