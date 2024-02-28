#!/bin/bash

# *********************************************************************************************
# Step 1: Create directory to store files in the home directory
mkdir -p ~/vbox &&
cd ~/vbox &&

# *********************************************************************************************
# Step 2: Download files from the VirtualBox repository

# Download the VirtualBox package for Ubuntu (amd64 architecture)
wget https://download.virtualbox.org/virtualbox/7.0.14/virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb

# Download the Guest Additions ISO
wget https://download.virtualbox.org/virtualbox/7.0.14/VBoxGuestAdditions_7.0.14.iso

# Download the VirtualBox Extension Pack
wget https://download.virtualbox.org/virtualbox/7.0.14/Oracle_VM_VirtualBox_Extension_Pack-7.0.14.vbox-extpack

# *********************************************************************************************
# Step 3: Install the VirtualBox package
sudo apt install -f virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb

# *********************************************************************************************
# Step 4: Install missing dependencies
sudo apt-get update -y && sudo apt --fix-broken install -y

# *********************************************************************************************
# Step 5: Create RSA keys
sudo mkdir -p /root/module-signing
cd /root/module-signing
sudo openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -days 365 -nodes -subj "/CN=My Corporation/"

# *********************************************************************************************
# Step 6: Install mokutil
sudo apt-get install mokutil -y

# *********************************************************************************************
# Step 7: Import keys after reboot PC with input password virtualbox
sudo mokutil --import /root/module-signing/MOK.der

# *********************************************************************************************
# Step 8: Change host key combination to AltGr
VBoxManage setextradata global "GUI/Input/HostKeyCombination" AltGraph

# *********************************************************************************************
# Step 9: Accept license and install the VirtualBox Extension Pack
sudo VBoxManage extpack install --replace ~/vbox/Oracle_VM_VirtualBox_Extension_Pack-7.0.14.vbox-extpack --accept-license=sha256


# *********************************************************************************************
#  Step XX: Remove vbox config and files

# Remove VirtualBox package
sudo apt-get remove --purge virtualbox && \

# Remove VirtualBox VMs directory
sudo rm ~/"VirtualBox VMs" -Rf && \

# Remove VirtualBox configuration directory
sudo rm ~/.config/VirtualBox/ -Rf && \

# Remove vbox.cfg file
sudo rm -f /etc/vbox/vbox.cfg && \

# Remove directory ssh keys
sudo rm -rf /ssh && \

# Remove virtualbox-dkms package
sudo apt-get remove virtualbox-dkms && \

# Purge virtualbox-dkms package
sudo apt-get remove --purge virtualbox-dkms && \

# Remove any remaining dependencies that were installed automatically and are no longer needed
sudo apt-get autoremove -y
