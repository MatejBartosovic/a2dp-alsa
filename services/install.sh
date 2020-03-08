cp -r bluetooth_config /etc/bluetooth

#sudo sudo systemctl restart bluetooth.service

sudo cp bt-agent.service /etc/systemd/system
sudo cp blue-alsa.service /etc/systemd/system
sudo cp blue-alsa-aplay.service /etc/systemd/system

systemctl daemon-reload

sudo sudo systemctl enable bt-agent.service
sudo sudo systemctl enable blue-alsa.service

sudo sudo systemctl start bt-agent.service
sudo sudo systemctl start blue-alsa.service
