# uWSGI and django with NGINX 

This document describes simple way to implement a sample django application with uWSGI service behinf nginx proxy. If you want to host your own application, you can replace directory "site1" with your own code. Be sure the application name is site1 and icluded necessary dependencies in Dockerfile

1. Clone this repo 
  
git clone https://github.com/dritto/assignment1.git

2. mv Dockerfile to current directory 

mv assignment1/Dockerfile ./

3. build the docker image 

docker build -t YOUR_IMAGE_NAME .

4. Run you container from newly created image 

docker run -p 80:80 YOUR_IMAGE_NAME 

