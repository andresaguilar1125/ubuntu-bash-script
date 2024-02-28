#!/bin/bash
# Script for various system configurations and installations

# Install net-tools for network utilities
sudo apt install net-tools -y

# Install curl for transferring data
sudo apt install curl -y

# Avoid system suspension when closing the lid
echo "HandleLidSwitch=ignore" | sudo tee -a /etc/systemd/logind.conf > /dev/null \
&& sudo systemctl restart systemd-logind

# Disable password prompt for current user in sudoers file
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers

# Allow unauthenticated repositories (Use with caution)
sudo apt-get update --allow-insecure-repositories
