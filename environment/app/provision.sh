#!/bin/bash


#Creating Bash Script

# upgrading any packages that are available
sudo apt-get upgrade -y

# Here we are installing nginx
sudo apt-get install nginx -y

# Configuring nginx proxy
cd /etc/nginx/sites-available
sudo chmod 666 default
echo "server{
  listen 80;
  location / {
      proxy_pass http://192.168.10.200:5000/;
  }
}" > default

sudo service nginx restart

# Installing Python Virtual Environment
sudo apt-get install python3.8-venv

# Creating the virtual environment
sudo python3.8 -m venv env

echo "nginx successfully installed"
