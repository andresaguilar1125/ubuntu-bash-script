#!/bin/bash
# Script to download and install Google Chrome on Debian-based Linux distributions

# Function to check if a command executed successfully
check_command() {
    if [ $? -ne 0 ]; then
        echo "Error: $1 failed. Exiting..."
        exit 1
    fi
}

# Download Google Chrome .deb package using wget
echo "Downloading Google Chrome..."
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
check_command "Download Google Chrome"

# Install the downloaded .deb package using gdebi
echo "Installing Google Chrome..."
sudo gdebi google-chrome-stable_current_amd64.deb -y
check_command "Install Google Chrome"

# Update package lists and upgrade installed packages
echo "Updating package lists and upgrading installed packages..."
sudo apt-get update -y && sudo apt-get upgrade -y
check_command "Update and upgrade packages"

# Optionally, remove the downloaded .deb package
echo "Removing downloaded .deb package..."
rm google-chrome-stable_current_amd64.deb

echo "Google Chrome installation completed successfully!"
