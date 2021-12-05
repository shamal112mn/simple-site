Jenkins project: Ubuntu 20.04, Jenkins, Linux, Docker, Vagrant, NGINX

```
Project setup: 
- master node -> Jenkins controller (docker container)
- worker node -> Jenkins agent (ssh agent)
- target node -> building node

Use Vagrantfile to build nodes

Use simple-webpage jenkins pipeline
 >> https://github.com/shamal112mn/simple-webpage.git
 to test jenkins setup on vagrant VMs

Nginx server will be running from port 80
Path for rendering folder in Nginx server is /var/www/html/index.thml
For updates, edit line #27 <h2> Version#1</h2> for practice

Navigate to localhost:8380  per Vagrantfile on target VM the host-> port 8380

```
