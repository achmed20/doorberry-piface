#!/bin/bash

echo "#####################################"
echo "Please enter target SIP goal without protocol!"
echo "can be changed afterwards in /etc/asterisk/extensions.conf"
echo "example: 'user@mysip.server.com'"

read siptarget

cat ../asterisk/extensions.conf | sed -e "s/#SIP-ADDRESS-GOES-HERE#/$siptarget/" > /etc/asterisk/extensions.conf
sudo chown asterisk.asterisk /etc/asterisk/*.conf
sudo chmod 640 /etc/asterisk/*.conf
sudo /etc/init.d/asterisk restart


