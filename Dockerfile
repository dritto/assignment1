FROM debian
MAINTAINER Bora Jagananth Naidu  version: 1.3

# Update and install required packages, Set logging , add user , create /etc/uwsgi/conf directory, remove default nginx enabled site confs
RUN apt-get update && apt-get --assume-yes install python3-pip python3 nginx && pip3 install uwsgi django && ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log && useradd -m -d /home/admin -s /bin/bash admin && mkdir -p /etc/uwsgi/conf && rm -rf /etc/nginx/sites-enabled/*

# Copy configuration and code 
COPY assignment1 /root/assignment1

# Copy files, change ownership and permissions of 
RUN cp /root/assignment1/site1.ini /etc/uwsgi/conf/ && cp /root/assignment1/default /etc/nginx/sites-enabled/ && cp -rpf /root/assignment1/uwsgi-service /etc/init.d/uwsgi-service && chmod a+x /etc/init.d/uwsgi-service &&  cp -rpf  /root/assignment1/service.sh /root/service.sh && cp -rpf /root/assignment1/site1 /home/admin/site1 && chown admin: -R /home/admin && chmod a+x /etc/init.d/uwsgi-service

# Expose ports 
EXPOSE 80 443

# Entrypoint 
CMD [ "bash", "/root/service.sh"]
