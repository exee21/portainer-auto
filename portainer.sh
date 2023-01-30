#!/bin/bash

# Install Docker
apt-get update
apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

# Get latest version of Portainer
LATEST_TAG=$(curl --silent https://api.github.com/repos/portainer/portainer/releases/latest | jq -r '.tag_name')

# Start Portainer container
docker run -d -p 9000:9000 --restart=always --name=portainer -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer:$LATEST_TAG
