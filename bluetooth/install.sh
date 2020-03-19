./compile_bluez.sh
sudo cp -r config/* /etc/bluetooth

#sudo sudo systemctl restart bluetooth.service

sudo cp services/bt-agent.service /etc/systemd/system
sudo cp services/config/blue-alsa.service /etc/systemd/system
sudo cp services/blue-alsa-aplay.service /etc/systemd/system

cd udev
./install.sh
cd ..

sudo systemctl daemon-reload

sudo sudo systemctl enable bt-agent.service
sudo sudo systemctl enable blue-alsa.service

sudo sudo systemctl start bt-agent.service
sudo sudo systemctl start blue-alsa.service
