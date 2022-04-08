#! /bin/bash
master_pod=$(kubectl get pods -o jsonpath="{range .items[*]}{.metadata.name}{\"\n\"}{end}" | grep jmeter-master)
port=$1

if [ -z "$port" ]; then
  echo "Usage: $0 <port>"
  exit 1
fi

if [ -n "$master_pod" ]; then
  echo "port forwarding pod: '$master_pod'"
  kubectl port-forward $master_pod $port:$port
else
  echo "No jmeter-master pod found"
fi