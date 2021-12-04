#!/bin/bash


pathToPrivateKey="/home/$USER/Documents/projects/VMs/vagrantfiles/jenkins-master-worker-target/"
cd $pathToPrivateKey
cat .vagrant/machines/master/virtualbox/private_key > myfolder/ssh/private_key
chmod 400 myfolder/ssh/private_key

 
