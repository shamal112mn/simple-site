Jenkins project: Ubuntu 20.04, Jenkins, Linux, Docker, Vagrant, NGINX

```
Project setup: 
- master node -> Jenkins controller (docker container)
- worker node -> Jenkins agent (ssh agent)
- target node -> building node

Use Vagrantfile to build nodes

Nginx server will be running from port 80
Path for rendering folder is /var/www/html/index.thml
For updates, edit line #27 <h2> Version#1</h2> for practice

```
