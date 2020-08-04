#!/bin/bash


#Creating Bash Script

# upgrading any packages that are available
sudo apt-get upgrade -y

# Here we are installing nginx
sudo apt-get install nginx -y

# Installing Python Virtual Environment
sudo apt-get install python3.8-venv

# Creating the virtual environment
sudo python3.8 -m venv env

echo "nginx successfully installed"
