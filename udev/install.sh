sudo mkdir -p /usr/local/etc/bluetooth_connect
sudo cp Echo.wav /usr/local/etc/bluetooth_connect/Echo.wav

sudo cp bluetooth_connect /usr/local/bin/bluetooth_connect
sudo cp bluetooth_disconnect /usr/local/bin/bluetooth_disconnect

sudo cp 99-input.rules /etc/udev/rules.d/99-input.rules
sudo udevadm control --reload
