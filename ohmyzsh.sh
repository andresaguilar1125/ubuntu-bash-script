#!/bin/bash
# Script to install Zsh and Oh My Zsh on Ubuntu Linux

# Function to check if a command executed successfully
check_command() {
    if [ $? -ne 0 ]; then
        echo "Error: $1 failed. Exiting..."
        exit 1
    fi
}

# Install Zsh using apt package manager
echo "Installing Zsh..."
sudo apt install zsh -y
check_command "Install Zsh"

# Download and execute Oh My Zsh installation script using curl
echo "Downloading and executing Oh My Zsh installation script..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
check_command "Download and execute Oh My Zsh installation script"

# Change the default shell to Zsh for the current user
echo "Changing the default shell to Zsh..."
sudo chsh -s /usr/bin/zsh
check_command "Change default shell to Zsh"

echo "Zsh and Oh My Zsh installation completed successfully!"
