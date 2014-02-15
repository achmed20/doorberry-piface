#!/bin/bash

#echo "### * Updating OS"
#sudo apt-get update
#sudo apt-get upgrade

#echo "* Update firmware"
#sudo apt-get install git-core
#sudo wget http://goo.gl/1BOfJ -O /usr/bin/rpi-update
#sudo chmod +x /usr/bin/rpi-update
#sudo rpi-update 
##echo "dwc_otg.speed=1 dwc_otg.lpm_enable=0 console=ttyAMA0,115200 kgdboc=ttyAMA0,115200 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline rootwait" > /tmp/cmdline.txt
##sudo sh -c "cp /tmp/cmdline.txt /boot/"
#grep -v "snd-bcm2835" /etc/modules > /tmp/modules
#sudo mv /tmp/modules /etc/
##sudo reboot


echo "### Install Depencies ###"
sudo apt-get install alsaplayer-alsa python2.7-dev python-daemon python-lockfile libv4l-dev libx264-dev libssl-dev libasound2-dev asterisk install python{,3}-pifacedigitalio git-core

#############################################################################

echo "### Downloading and compiling additional Programs"

cd
mkdir tmp

# required for video support
#cd $HOME/tmp
#wget http://www.libsdl.org/tmp/SDL-2.0.tar.gz
#tar xvfz SDL-2.0.tar.gz
#cd SDL-2.0.0-*
#./configure
#make
#sudo make install
#
#cd $HOME/tmp
#wget http://ffmpeg.org/releases/ffmpeg-0.10.7.tar.bz2
#tar xvfj ffmpeg-0.10.7.tar.bz2
#cd ffmpeg-0.10.7
#./configure --enable-shared --disable-static --enable-memalign-hack --enable-gpl --enable-libx264
#make
#sudo make install

############################################################################

echo "### * installing PJSIP "
cd $HOME/tmp
wget http://www.pjsip.org/release/2.1/pjproject-2.1.tar.bz2
tar xvfj pjproject-2.1.tar.bz2
cd pjproject-2.1.0/
./configure --disable-video --disable-l16-codec --disable-gsm-codec  --disable-g722-codec --disable-g7221-codec --disable-ilbc-codec
cat << PJ > pjlib/include/pj/config_site.h
#   define PJMEDIA_AUDIO_DEV_HAS_ALSA       1
#   define PJMEDIA_AUDIO_DEV_HAS_PORTAUDIO  0
PJ
make dep
make
sudo make install
cd pjsip-apps/src/python
make
sudo make install

#
#
#

echo "### * Installing WiringPI"
cd $HOME/tmp
git clone git://git.drogon.net/wiringPi
cd wiringPi
./build

cd $HOME
echo "### * Configuring asterisk"
sudo /etc/init.d/asterisk stop
sudo rm /etc/asterisk/*
sudo cp asterisk/cfg/* /etc/asterisk/
sudo chown asterisk.asterisk /etc/asterisk/*.conf
sudo chmod 640 /etc/asterisk/*.conf
sudo /etc/init.d/asterisk start

echo "### * Install doorberry-piface service"
sudo cp station/doorborry /etc/init.d/
sudo update-rc.d doorberry start 10 2 3 4 5
sudo update-rc.d doorberry stop 10 0 1 6 
