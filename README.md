This repository contains LambdaMOO and enCore database, and a bash script to install them on a stock Ubuntu server.

This branch contains the install.sh script, which will set up a modified version of enCore Xpress that removes the Java Applet, MOOtcan, which was used for the telnet connection.

After running the install.sh script, (make sure you ```git checkout js_telnet``` first after cloning to your server), follow the directions in enCoreChanges.md to convert the enCore database to the new JavaScript telnet client.
