#!/bin/bash
# Script to install prerequisites for package management on Ubuntu Linux

# Function to check if a command executed successfully
check_command() {
    if [ $? -ne 0 ]; then
        echo "Error: $1 failed. Exiting..."
        exit 1
    fi
}

# Add the 'universe' repository using add-apt-repository
echo "Adding 'universe' repository..."
echo -ne '\n' | sudo add-apt-repository universe
check_command "Add 'universe' repository"

# Update the package index to reflect changes
echo "Updating package index..."
sudo apt-get update
check_command "Update package index"

# Install gdebi-core for handling .deb packages
echo "Installing gdebi-core..."
sudo apt-get install gdebi-core -y
check_command "Install gdebi-core"

# Install gdebi for a graphical package installer
echo "Installing gdebi..."
sudo apt-get install gdebi -y
check_command "Install gdebi"

echo "Prerequisites installation completed successfully!"
