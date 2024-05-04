#!/bin/bash
# Script to install GConf2 on Debian-based Linux distributions

# Function to check if a command executed successfully
check_command() {
    if [ $? -ne 0 ]; then
        echo "Error: $1 failed. Exiting..."
        exit 1
    fi
}

# Download GConf2 Debian package from the Debian repository
echo "Downloading GConf2 Debian package..."
wget -q http://ftp.debian.org/debian/pool/main/g/gconf/gconf2_3.2.6-8_amd64.deb
check_command "Download GConf2 Debian package"

# Install the downloaded GConf2 package using dpkg
echo "Installing GConf2 package..."
sudo dpkg -i gconf2_3.2.6-8_amd64.deb
check_command "Install GConf2 package"

# Install any dependencies or fix broken packages using apt
echo "Installing dependencies or fixing broken packages..."
sudo apt install -f
check_command "Install dependencies or fix broken packages"

echo "GConf2 installation completed successfully!"
