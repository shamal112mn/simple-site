 

#!/bin/bash 

echo "docker.sh"
echo "Installing docker and docker-compose" 

sudo apt-get update 
sudo apt install docker.io -y 

# docker version 

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose 

sudo chmod +x /usr/local/bin/docker-compose 
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose 

sudo usermod -aG docker vagrant

 

