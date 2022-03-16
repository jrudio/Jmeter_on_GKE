# JMeter Master Image

This Dockerfile builds the Jmeter master node image.

This image includes `vncserver` to operate Jmeter's Test Planner in GUI mode

> Port 60000 is exposed on the master node to communicate with the workers.

## Steps to enable Jmeter's GUI mode

After starting up this pod you must manually set up the following on the pod

1. Connect to the master pod:

`kubectl exec -it jmeter-master-<pod-id> -- bash`

1. set a password for VNC server

`USER=<any-username> vncserver`

1. Port forward the pod to your local machine

`kubectl port-forward jmeter-master-<pod-id> 5901:5901`

1. Use a VNC client to connect

[RealVNC Viewer](https://www.realvnc.com/en/connect/download/viewer/)

Connect to `localhost:5901` and enter the password you had set earlier

1. Run Jmeter in GUI mode

Once connected using VNC viewer, open up a terminal and navigate to:

`cd /jmeter/apache-jmeter-5.4.3/bin`

run `./jmeter` to fire up Jmeter in GUI mode

1. Change Jmeter's theme

Once Jmeter GUI is running change the theme of Jmeter GUI: Options -> Look and Feel -> (any other theme) -> yes
Otherwise, you won't be able to save the Jmeter test plan you create

Changing the theme reloads the necessary files to use the file dialog

1. Configure Jmeter

Follow the instructions (starting at the backend listener) listed here:

https://github.com/mderevyankoaqa/jmeter-influxdb2-listener-plugin#deployment

The plugin is already in the proper directory, just point the backend listener to the influxdbv2 plugin and fill in the required parameters

1. Save your test

Once you have set up your Jmeter test, click File -> save and save to a path you will remember

Ideally, you would bring this .jmx file to your local machine so you can `kubectl cp jmeter-master-<pod-id>:<path-to-jmx-file> .`