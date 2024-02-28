#!/bin/bash
# Script to install Docker on Linux

# Download and execute Docker installation script using curl
sh -c "$(curl -fsSL https://get.docker.com/)" && \

# Add a docker group if it doesn't exist
sudo groupadd docker && \

# Add the current user to the docker group
sudo usermod -aG docker $USER && \

# Start a new shell with docker group permissions
sudo newgrp docker
