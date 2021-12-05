#!/bin/bash


docker run -d --name myjenkins -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts-jdk11

# sudo usermod -aG docker jenkins # this won't work because jenkins user doesn't exit
pathToJenkinsHome="/home/vagrant/myfolder/backups"
if [ -d "$pathToJenkinsHome/jenkins_home" ]
then 
    echo " Folder jenkins_home exist and skip the preparation."
else
    echo "Preparing jenkins_home for swapping"
    cd $pathToJenkinsHome
    cat  jenkins-home-tar-gz* > jenkins_home.tar.gz
    tar -xvzf jenkins_home.tar.gz 
    rm jenkins_home.tar.gz
    echo "Folder jenkins_home is prepared"
fi
echo "Swapping jenkins_home for running myjenkins container"
sleep 10
sudo rm -rf /var/lib/docker/volumes/jenkins_home
sleep 2
sudo cp -r  /home/vagrant/myfolder/backups/jenkins_home  /var/lib/docker/volumes
sleep 5
sudo chown -R 1000:1000 /var/lib/docker/volumes/jenkins_home
sleep 1
echo "Please, wait Restarting jenkins server"
docker restart myjenkins
echo "************************************"
echo 
echo "     jenkins admin user: "
echo "     username: admin"
echo "     password: admin"
echo 
echo "************************************"

 