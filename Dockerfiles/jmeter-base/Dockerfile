FROM openjdk:19-jdk-slim
LABEL maintainer=jrudio

ARG JMETER_VERSION=5.4.3
ARG JMETER_INFLUXDB_PLUGIN_VERSION=1.5
ARG JMETER_INFLUXDB_PLUGIN_URL=https://github.com/mderevyankoaqa/jmeter-influxdb2-listener-plugin/releases/download/v${JMETER_INFLUXDB_PLUGIN_VERSION}/jmeter-plugin-influxdb2-listener-${JMETER_INFLUXDB_PLUGIN_VERSION}-all.jar

RUN apt-get clean && \
apt-get update && \
apt-get -qy install \
wget \
telnet \
iputils-ping \
unzip

RUN   mkdir /jmeter \
&& cd /jmeter/ \
&& wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz \
&& tar -xzf apache-jmeter-$JMETER_VERSION.tgz \
&& rm apache-jmeter-$JMETER_VERSION.tgz

ENV JMETER_HOME /jmeter/apache-jmeter-$JMETER_VERSION/

RUN cd ${JMETER_HOME} && wget -q -O /tmp/JMeterPlugins-Standard-1.4.0.zip https://jmeter-plugins.org/downloads/file/JMeterPlugins-Standard-1.4.0.zip && unzip -n /tmp/JMeterPlugins-Standard-1.4.0.zip && rm /tmp/JMeterPlugins-Standard-1.4.0.zip

# Download JMeter pluging listener for InfluxDB
RUN wget $JMETER_INFLUXDB_PLUGIN_URL -o ${JMETER_HOME}/lib/ext/jmeter-plugin-influxdb2-listener-${JMETER_INFLUXDB_PLUGIN_VERSION}-all.jar

ENV PATH $JMETER_HOME/bin:$PATH
