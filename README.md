# a2dp-alsa

* Install bluez dependecies
```
sudo apt-get build-dep bluez
```
* Build bluez - maybe check the latest release
```
git clone git://git.kernel.org/pub/scm/bluetooth/bluez.git
cd bluez
git checkout 5.52
./bootstrap
./configure --enable-library --enable-experimental --enable-tools
make
sudo make install
sudo ln -s /usr/local/lib/libbluetooth.so.3.19.0 /usr/lib/arm-linux-gnueabihf/libbluetooth.so
sudo ln -s /usr/local/lib/libbluetooth.so.3.19.0 /usr/lib/arm-linux-gnueabihf/libbluetooth.so.3
sudo ln -s /usr/local/lib/libbluetooth.so.3.19.0 /usr/lib/arm-linux-gnueabihf/libbluetooth.so.3.19.0
```
* Install bluez-alsa dependencies
```
sudo apt install libsbc1 libsbc-dev
```
* Build bluez-alsa
```
git clone https://github.com/Arkq/bluez-alsa
cd bluez-alsa
autoreconf --install
mkdir build && cd build
../configure --disable-hcitop --with-alsaplugindir=/usr/lib/arm-linux-gnueabihf/alsa-lib --enable-ofono
make
sudo make install
```
