# Step 1: Create directory to store files in home directory
mkdir -p ~/vbox &&

# Change directory to the newly created one
cd ~/vbox &&

# Step 2: Download files from VirtualBox repository

# Download the VirtualBox package for Ubuntu (amd64 architecture)
wget https://download.virtualbox.org/virtualbox/7.0.14/virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb &&

# Download the Guest Additions ISO
wget https://download.virtualbox.org/virtualbox/7.0.14/VBoxGuestAdditions_7.0.14.iso &&

# Download the VirtualBox Extension Pack
wget https://download.virtualbox.org/virtualbox/7.0.14/Oracle_VM_VirtualBox_Extension_Pack-7.0.14.vbox-extpack &&

# Step 3: Install the VirtualBox package
sudo dpkg -i virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb

# Step 4 : Install misssing dependencies
sudo apt-get update -y && sudo apt --fix-broken install -y

# Setp 5 
sudo apt install --reinstall virtualbox-dkms -y 

# Step 6
sudo /sbin/vboxconfig



# Step2: 

# before first use
$ sudo apt install --reinstall virtualbox-dkms && sudo apt install libelf-dev -y \ sudo /sbin/vboxconfig


# add users vboxusers to the current user
sudo adduser $USER vboxusers

# make sure to reboot if secure boot is enabled to setup KOM or just disable secure boot

# https://devicetests.com/change-virtualbox-host-key-ubuntu
# change host key from terminal
sudo nano ~/.config/VirtualBox/VirtualBox.xml






# Uninstall virtualbox 
sudo apt-get remove --purge virtualbox 
# Run these commands to delete all virtual machines and settings and Virtual Hard Drives:
sudo rm ~/"VirtualBox VMs" -Rf
sudo rm ~/.config/VirtualBox/ -Rf
