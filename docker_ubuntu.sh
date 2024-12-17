
##installation ON ubuntu 24.04


#!/bin/bash

# Step 1: Update the package list
echo "Updating package list..."
sudo apt update -y

# Step 2: Install prerequisites
echo "Installing prerequisites..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Step 3: Add Docker’s official GPG key
echo "Adding Docker's GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Step 4: Set up the Docker stable repository
echo "Adding Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Step 5: Update the package list again to include Docker packages
echo "Updating package list again..."
sudo apt update -y

# Step 6: Install Docker Engine
echo "Installing Docker Engine..."
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Step 7: Start and enable Docker
echo "Starting and enabling Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

# Step 8: Verify Docker installation
echo "Verifying Docker installation..."
sudo docker --version

# Step 9: Install Docker Compose
echo "Installing Docker Compose..."
#sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d '\"' -f 4)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose

#####alternative of this######
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# Step 10: Verify Docker Compose installation
echo "Verifying Docker Compose installation..."
docker-compose --version

echo "Docker and Docker Compose have been installed successfully."
