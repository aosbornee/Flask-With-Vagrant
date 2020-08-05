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

# Directing to the synced app folder
cd /home/ubuntu/app

# Installing Python Virtual Environment
sudo apt-get install python3.8-venv -y

# Creating the virtual environment
sudo python3.8 -m venv env

#Updating all the installations
sudo apt-get update -y

# Installing pip
sudo apt-get install python3-pip -y

# Installing Flask
python3 -m pip install flask

#Installing FLask-login
python3 -m pip install flask-login
#Installing flask sqlalchemy
python3 -m pip install flask-sqlalchemy

#Running Flask application

export FLASK_APP=project
python3 -m flask run -h 0.0.0.0
