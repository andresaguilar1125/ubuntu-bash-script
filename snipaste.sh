#!/bin/bash
# Script to install libfuse required to run AppImages on Ubuntu

# Install libfuse2
sudo apt update
sudo apt install libfuse2 -y

# Create the directory for AppImages if it doesn't exist
mkdir -p ~/home/appimages

# Download Snipaste AppImage using wget
wget https://dl.snipaste.com/linux-beta -O ~/home/appimages/snipaste.appimage

# Give execution permissions to the AppImage
chmod +x ~/home/appimages/snipaste.appimage

# Create a desktop entry to add Snipaste to startup applications
cat << EOF | sudo tee /etc/xdg/autostart/snipaste.desktop
[Desktop Entry]
Type=Application
Exec=$HOME/home/appimages/snipaste.appimage
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Snipaste
Comment=Start Snipaste at login
EOF

echo "Installation and setup completed."
