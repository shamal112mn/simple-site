#!/bin/bash

# 2. Install Java 8 on Ubuntu Machine
sudo apt-get -y install openjdk-8-jdk openjdk-8-jre
java -version

# 3. Set JAVA_HOME Variables
cat >> /etc/environment <<EOL
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
JRE_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
EOL


# 4. First, add the repository key to the system
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

# 5. Next, append the Debian package repository address to the server’s sources.list
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# 6. Update System packages
sudo apt update


# 7. Install Jenkins and its dependencies
sudo apt -y install jenkins

# 8. Start Jenkins using systemctl
sudo systemctl start jenkins

# 9. Get Service Status
sudo systemctl status jenkins

# 10. Enable Jenkins Service
sudo systemctl enable jenkins

# 11. Use the cat command to display the password:
sudo cat /var/lib/jenkins/secrets/initialAdminPassword