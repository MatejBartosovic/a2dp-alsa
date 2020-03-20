#!/bin/bash
set -e
cd alsa
./install.sh
cd ../bluetooth
./install.sh
cd ../spotifyd
./install.sh
cd ../airplay
./install.sh
cd ../dlna
./install.sh
