#!/bin/bash
# Script to download and install Google Chrome on Debian-based Linux distributions

# Download Google Chrome .deb package using wget
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Install the downloaded .deb package using gdebi
sudo gdebi -i google-chrome-stable_current_amd64.deb

# Update package lists and upgrade installed packages
sudo apt-get update -y && sudo apt-get upgrade -y
