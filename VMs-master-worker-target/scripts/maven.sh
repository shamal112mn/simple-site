#!/bin/bash

echo "Install JAVA first then Install Maven "

sudo apt-get upadate
sudo apt install -y wget

# get maven 3.2.2
wget --no-verbose -O /tmp/apache-maven-3.5.4-bin.tar.gz http://apache.cs.utah.edu/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz

# verify checksum
# RUN echo "35c39251d2af99b6624d40d801f6ff02 /tmp/apache-maven-3.4.0-bin.tar.gz" | md5sum -c

# install maven
tar xzf /tmp/apache-maven-3.5.4-bin.tar.gz -C /opt/
ln -s /opt/apache-maven-3.5.4 /opt/maven
ln -s /opt/maven/bin/mvn /usr/local/bin
rm -f /tmp/apache-maven-3.5.4-bin.tar.gz
MAVEN_HOME="/opt/maven"