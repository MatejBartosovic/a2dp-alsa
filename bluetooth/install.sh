#!/bin/bash
err_report() {
    echo "Error on line $1"
    exit 1
}
trap 'err_report "${BASH_SOURCE}" "${LINENO}"' ERR
./compile_bluez.sh
sudo cp -r config/* /etc/bluetooth

#sudo sudo systemctl restart bluetooth.service

sudo cp services/bt-agent.service /etc/systemd/system
sudo cp services/blue-alsa.service /etc/systemd/system
sudo cp services/blue-alsa-aplay.service /etc/systemd/system

cd udev
./install.sh
cd ..

sudo systemctl daemon-reload

sudo sudo systemctl enable bt-agent.service
sudo sudo systemctl enable blue-alsa.service

sudo sudo systemctl start bt-agent.service
sudo sudo systemctl start blue-alsa.service
