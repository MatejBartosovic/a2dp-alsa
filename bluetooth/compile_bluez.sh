#!/bin/sh
set -e
codename=`lsb_release -c | awk '{print $2}'`
echo $codename
source_uri="deb-src\ http:\/\/raspbian.raspberrypi.org\/raspbian\/\ $codename\ main\ contrib\ non-free\ rpi"
echo $source_uri
sudo sed -i "s/#$source_uri/$source_uri/" /etc/apt/sources.list
sudo apt update
sudo apt -y upgrade
sudo apt -y install htop git build-essential libasound2-dev libdbus-1-dev libsbc-dev autoconf libglib2.0-dev libtool bluez-tools
sudo apt -y build-dep bluez

git clone git://git.kernel.org/pub/scm/bluetooth/bluez.git
cd bluez
git checkout 5.53
./bootstrap \
&& echo "This echo is hack"
./bootstrap
./configure --enable-library --enable-experimental --enable-tools
make
sudo make install
cd ..

git clone https://github.com/Arkq/bluez-alsa
cd bluez-alsa
autoreconf --install \
&& echo "This echo is hack"
autoreconf --install
mkdir build && cd build
../configure --disable-hcitop --with-alsaplugindir=/usr/lib/arm-linux-gnueabihf/alsa-lib
make
sudo make install
cd ..
