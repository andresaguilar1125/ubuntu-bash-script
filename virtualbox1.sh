# Links
# Enroll keys uefi
# https://devicetests.com/install-virtualbox-uefi-secure-boot-ubuntu

# Generate Key Pair Modules
openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -subj "/CN=virtualbox/"

# Install
sudo apt install mokutil

# Enroll Key
sudo mokutil --import MOK.der

# Sign modules virtualbox
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxdrv)
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxnetflt)
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxnetadp)

# Reboot pc
sudo reboot