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
# Step 3: Install the VirtualBox package through gdebi to install missing dependencies
sudo gdebi virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb

# There were problems setting up VirtualBox.  To re-start the set-up process, run
  /sbin/vboxconfig
as root.  If your system is using EFI Secure Boot you may need to sign the
kernel modules (vboxdrv, vboxnetflt, vboxnetadp, vboxpci) before you can load
them. Please see your Linux system's documentation for more information.
