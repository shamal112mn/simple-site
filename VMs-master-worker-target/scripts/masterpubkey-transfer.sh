#!/bin/bash

MASTER="master"
WORKER="worker"
TARGET="target"

pathMasterpubkey="home/vagrant/myfolder/ssh/master"

if [ $HOSTNAME = $MASTER ]
then
    cp /$pathMasterpubkey/id_rsa  /home/vagrant/.ssh/
    cp /$pathMasterpubkey/id_rsa.pub  /home/vagrant/.ssh/
else
    cat /$pathMasterpubkey/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

fi