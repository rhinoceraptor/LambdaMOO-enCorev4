#! /bin/bash
############
# Server deploy script from a bare Ubuntu install
# LambdaMOO and enCore db
# Jack Lewis

# Directories for installation
INSTALLDIR=/usr/local/moo
APACHEDIR=/etc/apache2

# If anything goes wrong (command returns non-zero), abort the script
set -e

# install updates, sudo, apache, make, gcc, bison, vim, csh non-interatively
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
apt-get -q -y install sudo apache2 gcc make bison vim csh nodejs nodejs-legacy npm
npm install -g coffee-script forever

# create a moo user, with sudo group,
useradd -g sudo -s /bin/bash -p users -d /home/moo -m moo

# make INSTALLDIR directory
mkdir ${INSTALLDIR}

# compile the MOO server
cd lambdamoo
sh configure
make
cd ..

# make bin directory, copy the moo server and the restart script to it
mkdir ${INSTALLDIR}/bin
cp lambdamoo/moo ${INSTALLDIR}/bin/
cp lambdamoo/restart.sh ${INSTALLDIR}/bin/
cp encore/enCore.db ${INSTALLDIR}/bin/

# Copy encore to /usr/local/moo/
cp -r encore ${INSTALLDIR}/

# Create an alias for Xpress. Works for 2.4.
echo -e "Alias /encore \"/usr/local/moo/encore\"\n<Directory /usr/local/moo/encore>\n\tRequire all granted\n</Directory>\n" >> ${APACHEDIR}/apache2.conf

# Chown the /usr/local/moo directory to moo user
cd ${INSTALLDIR}/..
chown -R moo moo

# Start the enCore server
chmod 755 ${INSTALLDIR}/bin/restart.sh
cd ${INSTALLDIR}/bin

# Install the JavaScript telnet client
cd ${INSTALLDIR}
git clone https://github.com/rhinoceraptor/LitWorlds.git
cd LitWorlds
git checkout telnet_only
cd src/server
npm install
cake build

cd ../client
cake build
cd ..
cp -r client /usr/local/moo/encore/

# Restart Apache
service apache2 restart
