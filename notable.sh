#!/bin/bash
# Script to download and install Notable MarkDown Text Editor on Debian-based Linux distributions

# Download Google Chrome .deb package using wget
wget https://download.notable.app/?target=deb

# Install the downloaded .deb package using gdebi
sudo gdebi google-chrome-stable_current_amd64.deb -y

# Update package lists and upgrade installed packages
sudo apt-get update -y && sudo apt-get upgrade -y
