#! /bin/bash

sleep 2
echo -e "\n######  Docker Temizleme   ######"
sudo apt-get purge docker-ce docker-ce-cli containerd.io -y
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
sudo apt-get clean
sudo apt-get autoremove -y
sudo apt-get update
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update

#######################################################################
#######################################################################

sleep 2
echo -e "\n###### Docker Kurulumu ######"
sudo apt-get install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
"deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
"$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin 

sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker

#######################################################################
#######################################################################
sleep 2
echo -e "\n######  Docker Compose   ######"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version  

#######################################################################
#######################################################################
sleep 2
echo -e "\n######  Docker Sudo   ######"
sudo groupadd docker 
sudo usermod -aG docker $USER  
newgrp docker 
docker ps
docker version
q

#######################################################################
#######################################################################


sleep 2
echo -e "\n######  Docker Bash Completion   ######"
sudo apt-get install bash-completion

#######################################################################
#######################################################################

# sudo apt install -f
echo -e "\n######  Docker Pulling   ######"
docker version 
docker run hello-world
docker pull nginx
docker pull httpd
docker pull mysql
docker pull mongo
docker pull ubuntu
docker pull centos

#######################################################################
#######################################################################


echo -e "\n######  Docker Login   ######"
docker login 
# docker logout

