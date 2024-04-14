#!/bin/bash
# Script to install by DMKS drivers for wifi realteak

# Clore original repository
git clone https://github.com/tomaspinho/rtl8821ce.git

# Change directory
cd rtl8821ce

# Use script to install drivers
sudo ./dkms-install.sh

# Do not forget to reboot computer after prompts!