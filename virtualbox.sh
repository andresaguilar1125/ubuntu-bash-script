#!/bin/bash

# *********************************************************************************************
# Section 1 : UEFI and Secure Boot
# *********************************************************************************************

# Step 1 : Install mokutil utility for managing Machine Owner Keys (MOKs) on UEFI systems
sudo apt install mokutil -y

# Step 2 : Generate Key Pair Modules using openssl to sign virtualbox modules
openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -subj "/CN=ANDRES/"

# Step 3: Enroll Key (`MOK.der`) into the system's MOK list using mokutil. This is necessary for Secure Boot.
sudo mokutil --import MOK.der

# Step 4 : Sign modules virtualbox (vboxdrv, vboxnetflt, vboxnetadp) using the generated key.
sudo apt-get install linux-headers-$(uname -r)

# Step 4 : Reinstall might be necessary to keep virtualbox latest version and resigned keys.
# sudo apt-get install --reinstall linux-headers-$(uname -r)

# Step 5: Sign each of the modules for virtualbox.
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxdrv)
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxnetflt)
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxnetadp)

# Step 5 : Reboot pc especially for Secure Boot to take effect.
sudo reboot


# *********************************************************************************************
# Section 2 : Virtualbox setup
# *********************************************************************************************

# Step 1: Create directory to store files in the home directory
mkdir -p ~/vbox &&
cd ~/vbox &&

# Step 2: Download files from the VirtualBox repository

# Download the VirtualBox package for Ubuntu (amd64 architecture)
wget https://download.virtualbox.org/virtualbox/7.0.14/virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb

# Download the Guest Additions ISO
wget https://download.virtualbox.org/virtualbox/7.0.14/VBoxGuestAdditions_7.0.14.iso

# Download the VirtualBox Extension Pack
wget https://download.virtualbox.org/virtualbox/7.0.14/Oracle_VM_VirtualBox_Extension_Pack-7.0.14.vbox-extpack

# Step 3: Install the VirtualBox package through gdebi to install missing dependencies
sudo gdebi virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb



# *********************************************************************************************
# Section 3 : Virtualbox Purge
# *********************************************************************************************

# Remove vbox config and files
sudo apt-get purge "^virtualbox-.*"

# Remove VirtualBox package
sudo apt-get remove --purge virtualbox && \

# Remove VirtualBox VMs directory
sudo rm ~/"VirtualBox VMs" -Rf && \

# Remove VirtualBox configuration directory
sudo rm ~/.config/VirtualBox/ -Rf && \

# Remove vbox.cfg file
sudo rm -f /etc/vbox/vbox.cfg && \

# Step XX : Remove sign keys (`MOK.priv` and `MOK.der`) from the system
sudo rm ./MOK.priv
sudo rm ./MOK.der

# Remove modules virtualbox modules from the system
sudo rm $(modinfo -n vboxdrv)
sudo rm $(modinfo -n vboxnetflt)
sudo rm $(modinfo -n vboxnetadp)

# Remove directory ssh keys
sudo rm -rf /ssh

# Purge and remove virtualbox-dkms package
sudo apt-get remove --purge virtualbox-dkms

# Remove any remaining dependencies that were installed automatically and are no longer needed
sudo apt-get autopurge -y && sudo apt-get update -y && sudo apt-get autoremove -y

# Remove all MOK enrolled
sudo mokutil --reset

# Reboot PC to clear keys on the boot MOK screen
sudo reboot