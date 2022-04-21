#! /bin/bash
#
# This script adds the worker IPs to the jmeter.properties file on the jmeter-master pod.
#
jmeter_all_remote_ip=$(kubectl get pods -o jsonpath="{range .items[?(@.metadata.labels.jmeter_mode==\"worker\")]}{.status.podIP}{\",\"}{end}" | sed 's/,$//')

if [ -z "$jmeter_all_remote_ip" ]; then
  echo "No worker IPs found."
  exit 1
fi

# copy the jmeter.properties file from the jmeter-master pod
master_pod=$(kubectl get pods -o jsonpath="{range .items[?(@.metadata.labels.jmeter_mode==\"master\")]}{.metadata.name}{end}")

if [ -z "$master_pod" ]; then
  echo "No master pod found."
  exit 1
fi

# TODO: edit the jmeter.properties file on the jmeter-master pod instead of copying the file locally
# something like: kubectl exec $master_pod -- sed -i 's/^remote_hosts=.*/remote_hosts=$jmeter_all_remote_ip/g' /jmeter/apache-jmeter-5.4.3/jmeter.properties
kubectl exec $master_pod -- sed -i.bak "s/^remote_hosts=.*/remote_hosts=$jmeter_all_remote_ip/g" /jmeter/apache-jmeter-5.4.3/bin/jmeter.properties

# echo the new remote worker IPs and finished to the console
echo "finished adding remote worker IPs to jmeter-master pod: $jmeter_all_remote_ip"