example splunk forwarder pkg
----------------------------

copy the [splunkfowarder](https://www.splunk.com/en_us/download/universal-forwarder.html) tgz file into the top folder, then run
    
    make pkg

This will result in a pkg that can be deployed, and it will load the launchdaemon if being installed on a live system.


