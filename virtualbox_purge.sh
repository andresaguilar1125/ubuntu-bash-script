
# *********************************************************************************************
#  Step XX: Remove vbox config and files

sudo apt-get purge "^virtualbox-.*"

# Remove VirtualBox package
sudo apt-get remove --purge virtualbox && \

# Remove VirtualBox VMs directory
sudo rm ~/"VirtualBox VMs" -Rf && \

# Remove VirtualBox configuration directory
sudo rm ~/.config/VirtualBox/ -Rf && \

# Remove vbox.cfg file
sudo rm -f /etc/vbox/vbox.cfg && \

# Remove any remaining dependencies that were installed automatically and are no longer needed
sudo apt-get autoremove -y


# *********************************************************************************************
# Step XX : Remove sign keys (`MOK.priv` and `MOK.der`) from the system
sudo rm ./MOK.priv
sudo rm ./MOK.der

# Remove all MOK enrolled ⚠️⚠️ RESET PC ⚠️⚠️
sudo mokutil --reset

# Remove modules virtualbox modules from the system
sudo rm $(modinfo -n vboxdrv)
sudo rm $(modinfo -n vboxnetflt)
sudo rm $(modinfo -n vboxnetadp)

# Remove directory ssh keys
sudo rm -rf /ssh

# Purge and remove virtualbox-dkms package
sudo apt-get remove --purge virtualbox-dkms

# update and purge
sudo apt-get autopurge -y && sudo apt-get update -y