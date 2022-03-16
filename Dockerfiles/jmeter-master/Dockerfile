FROM jrudio/jmeter-base:v0.0.1

LABEL maintainer=jrudio

ARG JMETER_INFLUXDB_PLUGIN_VERSION=1.5
ARG JMETER_INFLUXDB_PLUGIN_URL=https://github.com/mderevyankoaqa/jmeter-influxdb2-listener-plugin/releases/download/v${JMETER_INFLUXDB_PLUGIN_VERSION}/jmeter-plugin-influxdb2-listener-${JMETER_INFLUXDB_PLUGIN_VERSION}-all.jar

EXPOSE 60000

# Add vncviewer and xfce4
# bypass the keyboard prompt from xfce
RUN apt-get update && apt-get -qy install tightvncserver
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install xfce4 xfce4-goodies

# remove accessibility atrribute to prevent error on jmeter GUI startup
# RUN len=$(( ${#JAVA_VERSION} - 6 )); JAVA_COMPACT_VERSION=$(echo $JAVA_VERSION | cut -c1-$len); sed -i -e '/^assistive_technologies=/s/^/#/' /etc/java-${JAVA_COMPACT_VERSION}-openjdk/accessibility.properties
# RUN len=$(( ${#JAVA_VERSION} - 6 )); JAVA_COMPACT_VERSION=$(echo $JAVA_VERSION | cut -c1-$len); ls /etc

# Download JMeter pluging listener for InfluxDB
RUN wget $JMETER_INFLUXDB_PLUGIN_URL -o ${JMETER_HOME}/lib/ext/jmeter-plugin-influxdb2-listener-${JMETER_INFLUXDB_PLUGIN_VERSION}-all.jar