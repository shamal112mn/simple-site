#!/bin/bash

echo "Starting up  backup jenkins_home"

# execute in root

pathVolumes="/var/lib/docker/volumes"

if [ -d "$pathVolumes/jenkins_home" ]
then    
    cd $pathVolumes
    tar -cvzf jenkins_home.tar.gz  jenkins_home
    split -b 40M  jenkins_home.tar.gz  jenkins-home-tar-gz
    mv jenkins-home-tar-gz*  /home/vagrant/myfolder/backups
    cd /home/vagrant/myfolder/backups
    su vagrant
else 
    echo "jenkins_home doesn't exist"

fi

