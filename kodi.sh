#!/bin/bash

# Install necessary packages
echo "Installing software-properties-common..."
sudo apt install software-properties-common -y

echo "Adding Kodi PPA repository..."
sudo add-apt-repository -y ppa:team-xbmc/ppa

echo "Updating package lists..."
sudo apt update

echo "Installing Kodi..."
sudo apt install kodi -y

echo "Installing Kodi PVR IPTV Simple Client..."
sudo apt-get install kodi-pvr-iptvsimple -y

echo "Kodi installation completed successfully."
