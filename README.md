# a2dp-alsa

* Install all dependecies
```
echo "deb-src http://raspbian.raspberrypi.org/raspbian/ buster main contrib non-free rpi" >> /etc/apt/sources.list
sudo apt update
sudo apt upgrade
sudo apt -y install htop git build-essential libasound2-dev libdbus-1-dev libsbc-dev autoconf libglib2.0-dev libtool
sudo apt-get build-dep bluez```
* Build bluez - maybe check the latest release
```
git clone git://git.kernel.org/pub/scm/bluetooth/bluez.git
cd bluez
git checkout 5.53
./bootstrap
./configure --enable-library --enable-experimental --enable-tools
make
sudo make install
```
* Install bluez-alsa dependencies
```
sudo apt install libsbc1 libsbc-dev
```
* Build bluez-alsa
```
libtoolize
git clone https://github.com/Arkq/bluez-alsa
cd blue-alsa
autoreconf --install
mkdir build && cd build
../configure
make
```
