# Step 1: Create directory on home ~ to store files
mkdir -p ~/vbox &&

# cd to this directory
cd ~/vbox &&

# Step 2: Download files from repo download.virtualbox.org/virtualbox/

# get deb for amd64 arch
wget https://download.virtualbox.org/virtualbox/6.1.50/VirtualBox-6.1.50-161033-Linux_amd64.run &&

# get iso for version
wget https://download.virtualbox.org/virtualbox/6.1.50/VBoxGuestAdditions_6.1.50.iso &&

# get extension pack
wget https://download.virtualbox.org/virtualbox/6.1.50/Oracle_VM_VirtualBox_Extension_Pack-6.1.50.vbox-extpack &&

# Step3 : Make it executable 
sudo chmod +x VirtualBox-6.1.50-161033-Linux_amd64.run

# Step4: Execute linux amd64 run
sudo ./VirtualBox-6.1.50-161033-Linux_amd64.run



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
