# --------------------------------------------
#  Step 1: Create directory to store files in home directory
mkdir -p ~/vbox &&
cd ~/vbox &&

# --------------------------------------------
#  Step 2: Download files from VirtualBox repository

# Download the VirtualBox package for Ubuntu (amd64 architecture)
wget https://download.virtualbox.org/virtualbox/7.0.14/virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb

# Download the Guest Additions ISO
wget https://download.virtualbox.org/virtualbox/7.0.14/VBoxGuestAdditions_7.0.14.iso

# Download the VirtualBox Extension Pack
wget https://download.virtualbox.org/virtualbox/7.0.14/Oracle_VM_VirtualBox_Extension_Pack-7.0.14.vbox-extpack

# --------------------------------------------
#  Step 3: Install the VirtualBox package
sudo dpkg -i virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb

# --------------------------------------------
#  Step 4 : Install missing dependencies
sudo apt-get update -y && sudo apt --fix-broken install -y

# --------------------------------------------
#  Step 5: Reinstall virtualbox-dkms
sudo apt install --reinstall virtualbox-dkms -y 

# --------------------------------------------
#  Step 6: Configure vbox
sudo /sbin/vboxconfig

# --------------------------------------------
#  Step 7: Add current user to vboxusers group
sudo adduser $USER vboxusers

# --------------------------------------------
#  Step 8: Change host key combination to AltGr
VBoxManage setextradata global "GUI/Input/HostKeyCombination" AltGraph

# --------------------------------------------
#  Step 9 : Accept license and press y
sudo VBoxManage extpack install --replace ~/vbox/Oracle_VM_VirtualBox_Extension_Pack-7.0.14.vbox-extpack --accept-license=sha256 

# --------------------------------------------
#  Step 10: DMKS
sudo apt install --reinstall linux-headers-$(uname -r) virtualbox-dkms dkms

# --------------------------------------------
#  Step 11: Remove vbox config and files

# Remove VirtualBox package
sudo apt-get remove --purge virtualbox

# Remove VirtualBox VMs directory
sudo rm ~/"VirtualBox VMs" -Rf

# Remove VirtualBox configuration directory
sudo rm ~/.config/VirtualBox/ -Rf

# Remove vbox.cfg file
sudo rm -f /etc/vbox/vbox.cfg

# Remove virtualbox-dkms package
sudo apt-get remove virtualbox-dkms

# Purge virtualbox-dkms package
sudo apt-get remove --purge virtualbox-dkms

# Remove any remaining dependencies that were installed automatically and are no longer needed
sudo apt-get autoremove -y
