This repository contains LambdaMOO and enCore database, and a bash script to install them on a stock Ubuntu server.

After running the install.sh script, you will need to:
- set a UNIX password for the moo user
- configure the MOO, by performing the following:
  - `telnet 127.0.0.1 7777`
  - `co wizard`
  - `@configure`
  - Modify the MOO domain name (option 8) to your domain or IP address
  - Modify the base URL (option 18) to `http://<your domain or ip>/encore`

The js_telnet branch contains a modified enCore database, as well as removing MOOtcan and replacing it the a Javascript only telnet client.
