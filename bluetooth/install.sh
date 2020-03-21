#!/bin/bash
err_report() {
    echo "Error on line $2"
    exit 1
}
trap 'err_report "${BASH_SOURCE}" "${LINENO}"' ERR

sudo apt install -y bluez bluez-tools bluealsa

sudo cp -r config/* /etc/bluetooth

sudo cp services/bluealsa.service /lib/systemd/system/
sudo cp services/bt-agent.service /etc/systemd/system/
sudo cp services/blue-alsa-aplay.service /etc/systemd/system/

cd udev
./install.sh
cd ..

sudo systemctl daemon-reload

sudo systemctl enable bt-agent.service
sudo systemctl enable bluealsa.service
sudo systemctl enable blue-alsa-aplay.service

sudo systemctl restart bluetooth.service
sudo systemctl start bt-agent.service
sudo systemctl start bluealsa.service
sudo systemctl start blue-alsa-aplay.service
