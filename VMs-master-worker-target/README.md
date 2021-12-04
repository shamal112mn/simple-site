

Building 3 servers

```
1. Master node with Jenkins server instance running on it in docker container.

2. Worker node -> for jenkins to execute builds on it, connected as ssh agent,
   hwhre jenkins jobs executed in docker container via docker pipeline plugin.

3. Target node -> jenkins jobs will be building and deploying applications



sudo vi /etc/hosts

100.0.0.1  my.master.net  master
100.0.0.2  my.worker.net  worker 
100.0.0.2  my.target.net  target 

to conect remote with VScode, type 
vagrant up
vagrant ssh-config
copy output 
paste in .ssh/config

example below:

Host master
  HostName 127.0.0.1
  User vagrant
  Port 2222
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile /home/$USER/Documents/projects/VMs/vagrantfiles/VMs-master-worker-target/.vagrant/machines/jenkins/virtualbox/private_key
  IdentitiesOnly yes
  LogLevel FATAL  


vagrant plugin install vagrant-disksize

config.disksize.size = '50GB'


```