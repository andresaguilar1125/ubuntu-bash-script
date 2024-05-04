#!/bin/bash
# Script to configure system settings on Ubuntu Linux

# Function to check if a command executed successfully
check_command() {
    if [ $? -ne 0 ]; then
        echo "Error: $1 failed. Exiting..."
        exit 1
    fi
}

# Avoid system suspension when closing the lid
echo "Configuring lid switch handling..."
echo "HandleLidSwitch=ignore" | sudo tee -a /etc/systemd/logind.conf > /dev/null
check_command "Configure lid switch handling"
sudo systemctl restart systemd-logind
check_command "Restart systemd-logind service"

# Disable password prompt for current user in sudoers file
echo "Disabling password prompt for current user in sudoers file..."
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers > /dev/null
check_command "Disable password prompt for current user in sudoers file"

echo "System configuration completed successfully!"
