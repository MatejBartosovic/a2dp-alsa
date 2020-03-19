sudo apt-get update
sudo apt -y install  build-essential autoconf automake libtool pkg-config
sudo apt -y install libupnp-dev libgstreamer1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav
sudo apt -y install gstreamer1.0-alsa
git clone https://github.com/hzeller/gmrender-resurrect.git
cd gmrender-resurrect
./autogen.sh
./configure
make
sudo make install
cd ..
sudo cp gmrender-resurrect.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start gmrender-resurrect
sudo systemctl enable gmrender-resurrect
