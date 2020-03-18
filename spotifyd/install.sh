uri=`curl --silent "https://api.github.com/repos/Spotifyd/spotifyd/releases/latest" | grep "browser_download_url*" | grep "armv6" | grep ".tar.gz" | sed -E 's/.*"([^"]+)".*/\1/'`
echo $uri
wget -q $uri
file=`echo "$uri" | sed -e 's/https:\/\/.*\///g'`
echo $file
tar -xzvf $file
sudo cp spotifyd /usr/local/bin/
sudo mkdir -p /etc/spotifyd/
sudo cp spotifyd.conf /etc/spotifyd/
sudo cp spotifyd.service /etc/systemd/system/
rm $file
rm spotifyd
sudo systemctl daemon-reload
sudo sudo systemctl start spotifyd
sudo sudo systemctl enable spotifyd
