#!/bin/bash
apt-get update -y && apt-get upgrade -y
apt-get install -y wget rsync xmlstarlet lib32gcc1 lib32stdc++6 make gcc cron vim
useradd -d /home/sdtd -m -r -s /bin/bash -U sdtd
wget http://illy.bz/fi/7dtd/management_scripts.tar.gz
tar --touch -xvzf management_scripts.tar.gz -C /
update-rc.d 7dtd.sh defaults
cd /usr/local/lib/7dtd/start-stop-daemon
make
gcc -o start-stop-daemon start-stop-daemon.c
make install
chown root.root start-stop-daemon
chmod 0755 start-stop-daemon
chown root.root /etc/7dtd.conf
chmod 0600 /etc/7dtd.conf
chown sdtd.sdtd /home/sdtd -R
chown root.root /etc/init.d/7dtd.sh
chown root.root /etc/bash_completion.d/7dtd
chown root.root /usr/local/bin/7dtd.sh
chown root.root /usr/local/lib/7dtd -R
chmod 0755 /etc/init.d/7dtd.sh
chmod 0755 /etc/bash_completion.d/7dtd
chmod 0755 /usr/local/bin/7dtd.sh
chmod 0755 /usr/local/lib/7dtd -R
echo "0 * * * *   root	nice -n 36 /usr/local/bin/7dtd.sh backup" > /etc/crontab 
crontab /etc/crontab


