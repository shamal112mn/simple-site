#!/bin/bash


docker run -d --name myjenkins -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts-jdk11

# sudo usermod -aG docker jenkins # this won't work because jenkins user doesn't exit
sleep 20
sudo rm -rf /var/lib/docker/volumes/jenkins_home
sleep 2
sudo cp -r  /home/vagrant/myfolder/vm_disks/jenkins/*  /var/lib/docker/volumes/
sleep 5
sudo chown -R 1000:1000 /var/lib/docker/volumes/jenkins_home
sleep 1
echo "Please, wait Restarting jenkins server"
docker restart myjenkins
 