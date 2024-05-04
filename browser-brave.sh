#!/bin/bash
# Script to install Brave browser on Ubuntu Linux

# Check if curl package is installed, if not, install it
if ! command -v curl &> /dev/null; then
    echo "curl package is not installed. Installing..."
    sudo apt install -y curl
fi

# Download Brave browser GPG key and store it in /usr/share/keyrings/
echo "Downloading Brave browser GPG key..."
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

# Add Brave browser repository configuration
echo "Adding Brave browser repository configuration..."
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list > /dev/null

# Update package index to reflect changes
echo "Updating package index..."
sudo apt update

# Install Brave browser
echo "Installing Brave browser..."
sudo apt install -y brave-browser

# Check if installation was successful
if [ $? -eq 0 ]; then
    echo "Brave browser installation completed successfully!"
else
    echo "Error: Brave browser installation failed. Please check the logs for more details."
fi
