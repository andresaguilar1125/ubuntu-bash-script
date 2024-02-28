#!/bin/bash

# Step 1 : Install mokutil utility for managing Machine Owner Keys (MOKs) on UEFI systems
sudo apt install mokutil -y

# Step 2 : Generate Key Pair Modules using openssl to sign virtualbox modules
openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -subj "/CN=ANDRES/"

# Step 3: Enroll Key (`MOK.der`) into the system's MOK list using mokutil. This is necessary for Secure Boot.
sudo mokutil --import MOK.der

# Step 4 : Sign modules virtualbox (vboxdrv, vboxnetflt, vboxnetadp) using the generated key.
sudo apt-get install linux-headers-$(uname -r)

# Step 4 : Reinstall might be necessary to keep virtualbox latest version and resigned keys.
sudo apt-get install --reinstall linux-headers-$(uname -r)

# Step 5 : Reboot pc especially for Secure Boot to take effect.
sudo reboot

# REVIEW: Sign modules virtualbox (vboxdrv, vboxnetflt, vboxnetadp) using the generated key.
#sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxdrv)
#sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxnetflt)
#sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxnetadp)

