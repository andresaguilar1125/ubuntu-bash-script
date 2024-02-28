## extension manager
sudo snap install gnome-extension-manager
sudo apt-get install gnome-shell-extension-manager

## brave
sudo apt install curl && \
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg && \
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | \
sudo tee /etc/apt/sources.list.d/brave-browser-release.list && \
sudo apt update && \
sudo apt install brave-browser

## ohmyzsh
sudo apt install zsh -y && \
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y && \
sudo chsh -s /usr/bin/zsh

## docker
sh -c "$(curl -fsSL https://get.docker.com/)" && \
sudo groupadd docker && \
sudo usermod -aG docker $USER && \
sudo newgrp docker 


## gdebi
echo -ne '\n' | \
sudo add-apt-repository universe \
&& sudo apt-get update \
&& sudo apt-get install gdebi-core -y \
&& sudo apt-get install gdebi -y

## multipass

## vscode
arch=$(lscpu | grep Architecture | awk '{print $2}') \
&& curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
&& sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
&& sudo sh -c "echo \"deb [arch=${arch}] https://packages.microsoft.com/repos/code insiders main\" > /etc/apt/sources.list.d/vscode.list" \
&& sudo apt update \
&& sudo apt install code


## vbox
no descargar del sitio principal solo del repositorio con deb y extpack especifica
# get files from repo download.virtualbox.org/virtualbox/ 
# iso and extension pack must be the same version 
# add users vboxusers to the current user
# run script: sudo adduser $USER vboxusers
antes de usar hacer esto
$ sudo apt install --reinstall virtualbox-dkms && sudo apt install libelf-dev -y
sudo /sbin/vboxconfig
# make sure to reboot if secure boot is enabled to setup KOM or just disable secure boot
# not forget to change the host key 


## vmware 
# sign kb.vmware.com/s/article/2146460
# make sure to reboot if secure boot is enabled to setup KOM or just disable secure boot

## net-tools
sudo apt install net-tools -y

## curl
sudo apt install curl -y

## gconf2
wget http://ftp.debian.org/debian/pool/main/g/gconf/gconf2_3.2.6-8_amd64.deb && \
sudo dpkg -i gconf2_3.2.6-8_amd64.deb \
&& sudo apt install -f

# avoid suspend when closing the lid
echo "HandleLidSwitch=ignore" | \
sudo tee -a /etc/systemd/logind.conf > /dev/null \
&& sudo systemctl restart systemd-logind

# disable uac on linux
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | \
sudo tee -a /etc/sudoers

# unauthenticated repositories
sudo apt-get update --allow-insecure-repositories