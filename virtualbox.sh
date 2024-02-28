# ->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->
# Oracle Virtualbox
# ->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->

# no descargar del sitio principal solo del repositorio con deb y extpack especifica
# files from repo download.virtualbox.org/virtualbox/ 
# get deb for amd64 arch
wget https://download.virtualbox.org/virtualbox/6.1.0_RC1/VirtualBox-6.1.0_RC1-134891-Linux_amd64.run
# get iso for version
wget https://download.virtualbox.org/virtualbox/6.1.0_RC1/VBoxGuestAdditions_6.1.0_RC1.iso
# get extension pack
wget https://download.virtualbox.org/virtualbox/6.1.0_RC1/Oracle_VM_VirtualBox_Extension_Pack-6.1.0_RC1-134891.vbox-extpack
# run later
# add users vboxusers to the current user
# run script: sudo adduser $USER vboxusers
# before first use
$ sudo apt install --reinstall virtualbox-dkms && sudo apt install libelf-dev -y \ sudo /sbin/vboxconfig
# make sure to reboot if secure boot is enabled to setup KOM or just disable secure boot
# not forget to change the host key 

