#!/bin/bash

# Create Docker volume for Portainer
sudo docker volume create portainer_data

# Run Portainer container
sudo docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data --restart always --name portainer portainer/portainer
