sudo apt update
sudo apt -y install build-essential git xmltoman autoconf automake libtool libpopt-dev libconfig-dev libasound2-dev avahi-daemon libavahi-client-dev libssl-dev libsoxr-dev
git clone https://github.com/mikebrady/shairport-sync.git
cd shairport-sync
autoreconf -fi
./configure --sysconfdir=/etc --with-alsa --with-soxr --with-avahi --with-ssl=openssl --with-systemd
make
sudo make install
cd ..
sudo cp shairport-sync.conf /etc/
sudo systemctl daemon-reload
sudo systemctl start shairport-sync
sudo systemctl enable shairport-sync
