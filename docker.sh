#!/bin/bash
# Script to install Docker on Linux

# Function to check if a command executed successfully
check_command() {
    if [ $? -ne 0 ]; then
        echo "Error: $1 failed. Exiting..."
        exit 1
    fi
}

# Download and execute Docker installation script using curl
echo "Downloading and executing Docker installation script..."
sh -c "$(curl -fsSL https://get.docker.com/)"
check_command "Download and execute Docker installation script"

# Add a docker group if it doesn't exist
if ! grep -q "^docker:" /etc/group; then
    echo "Adding docker group..."
    sudo groupadd docker
    check_command "Add docker group"
fi

# Add the current user to the docker group
echo "Adding $USER to the docker group..."
sudo usermod -aG docker $USER
check_command "Add user to docker group"

# Notify the user to restart the shell or logout and login again for the changes to take effect
echo "Please restart your shell or logout and login again for Docker changes to take effect."
