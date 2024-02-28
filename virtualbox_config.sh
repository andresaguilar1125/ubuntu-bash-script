
# *********************************************************************************************
# Step 8: Change host key combination to AltGr
VBoxManage setextradata global "GUI/Input/HostKeyCombination" AltGraph

# *********************************************************************************************
# Step 9: Accept license and install the VirtualBox Extension Pack
sudo VBoxManage extpack install --replace ~/vbox/Oracle_VM_VirtualBox_Extension_Pack-7.0.14.vbox-extpack --accept-license=sha256
