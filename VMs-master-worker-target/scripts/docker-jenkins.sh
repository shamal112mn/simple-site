#!/bin/bash


docker run -d --name myjenkins -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts-jdk11

 
pathToJenkinsHome="/home/vagrant/myfolder/backups"

if [ -d "$pathToJenkinsHome/jenkins_home" ]
then 
    echo " Folder jenkins_home exist and skip the preparation."
else
    cd $pathToJenkinsHome

    if [ -f jenkins-home-tar-gzaa ]
    then
        echo "Preparing jenkins_home for swapping"
        
        cat  jenkins-home-tar-gz* > jenkins_home.tar.gz
        tar -xvzf jenkins_home.tar.gz 
        rm jenkins_home.tar.gz
        rm jenkins-home-tar*
        rm split-backup.sh

        echo "Folder jenkins_home is prepared"
    else
        echo "****************************"
        echo
        echo "Jenkins Archive files is missing or broken. "
        echo "Folder jenkins_home will be not configure for you."
        echo "Please, Reclone project or configure manually"
        echo
        echo " Your initial password string: "
        docker exec myjenkins bash -c "cat  /var/jenkins_home/secrets/initialAdminPassword"
        echo
        echo "********************************"
    fi    

fi
echo "Swapping jenkins_home for running myjenkins container"
sleep 15
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
echo "  Navigate on browser: localhost:8090"
echo
echo "     jenkins admin user: "
echo "     username: admin"
echo "     password: admin"
echo 
echo "************************************"

 
 
