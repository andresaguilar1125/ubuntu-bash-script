#!/bin/bash
# Script to install Brave browser on Ubuntu Linux

# Install curl package if not already installed
sudo apt install curl && \

# Download Brave browser GPG key and store it in /usr/share/keyrings/
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg && \

# Add Brave browser repository configuration
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list && \

# Update package index to reflect changes
sudo apt update && \

# Install Brave browser
sudo apt install brave-browser
