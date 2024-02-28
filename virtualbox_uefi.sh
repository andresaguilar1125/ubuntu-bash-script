#!/bin/bash

# *********************************************************************************************
# Step 1: # Generate Key Pair Modules using openssl to sign virtualbox modules
openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -subj "/andresvirtualbox/"

# *********************************************************************************************
# Step 2 : Install mokutil utility for managing Machine Owner Keys (MOKs) on UEFI systems
# to manage mok keys docs https://manpages.ubuntu.com/manpages/lunar/man1/mokutil.1.html
sudo apt install mokutil

# Enroll Key (`MOK.der`) into the system's MOK list using mokutil. This is necessary for Secure Boot.
sudo mokutil --import MOK.der

# Sign modules virtualbox (vboxdrv, vboxnetflt, vboxnetadp) using the generated key.
sudo apt-get install linux-headers-`uname -r`












# Sign modules virtualbox (vboxdrv, vboxnetflt, vboxnetadp) using the generated key.
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxdrv)
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxnetflt)
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxnetadp)

# Install DKMS virtualbox
sudo apt install virtualbox-dkms -y
sudo apt install --reinstall virtualbox-dkms -y

# *********************************************************************************************
# Step 3 : Reboot pc especially for Secure Boot to take effect.
sudo reboot

# *********************************************************************************************
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

# Remove all MOK enrolled ⚠️⚠️ RESET PC ⚠️⚠️
sudo mokutil --reset

# update and purge
sudo apt-get autopurge -y && sudo apt-get update -y