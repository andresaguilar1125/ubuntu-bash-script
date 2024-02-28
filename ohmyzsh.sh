#!/bin/bash
# Script to install Zsh and Oh My Zsh on Ubuntu Linux

# Install Zsh using apt package manager
sudo apt install zsh -y && \

# Download and execute Oh My Zsh installation script using curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y && \

# Change the default shell to Zsh for the current user
sudo chsh -s /usr/bin/zsh
