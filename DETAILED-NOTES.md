# Running A Flask Application On Nginx using a Virtual Machine

This repo will bring together many of the concepts that have previously been touched upon, we will work with;
- Flask
- Vagrant
- Ruby
- Virtual Box
- Git Bash

## Prerequisites for this Project


### Why We Use Dev Environments To Tests Applications



### Creating Our Vagrant File
We will create a folder named 'Flask-With-Vagrant' and enter this folder using git bash. Once here we create a vagrant
file and then enter it
```bash
touch Vagrantfile
nano Vagrantfile
```

Alternatively we can create a default vagrant file by running the code ``` vagrant init ```

We can then add the basic configuration to get it up and running
```bash
# The 2 refers to the version of configuration
Vagrant.configure("2") do |config|

# creating an ubuntu virtual machine 
# In this case we have used this box as it is 20-04 and it makes virtual environments easier to create
  config.vm.box = "bento/ubuntu-20.04"

# Creating a private ip to access our nginx web server
  config.vm.network "private_network", ip: "192.168.10.200"
  
# redirecting the above IP to a specific web address
  config.hostsupdater.aliases = ["flaskapp.local"]

end
```

We want to install nginx every time we run this VM, in order to do this we will create an enivronments directory and then
an app directory inside of this

```
mkdir environment
mkdir app
cd app
nano provision.sh
```


within this it will have the provision.sh bash script which would then run the commands specified
```bash
#!/bin/bash


#Creating Bash Script

# upgrading any packages that are available
sudo apt-get upgrade -y

# Here we are installing nginx
sudo apot-get install nginx -y

echo "nginx successfully installed"
```
We will add to this bash script later when we attempt to automate running our flask application

In order for file to run, we would need to first snyc the VM directory with our OS directory and
then run this file. We will use the below code to do this by adding it to our vagrant file

```bash
app.vm.synced_folder "app", "/home/ubuntu/app"
# the below code run 
app.vm.provision "shell", path: "environment/app/provision.sh", privileged: false
```


### Adding the flask application to the vagrant folder

- In order to move the folder into the vagrant folder we run the following command

```commandline
mv C:\Users\aosbo\PycharmProjects Flask-App C:\Users\aosbo\VagrantProjects\Flask-With-Vagrant\app
```

```
cd /home/ubuntu/app
```
This command will take us to our app folder in our VM, once here we will download the dependencies needed for us to
use python
```commandline

sudo apt-get install python3-venv
```

We can now run the commands to create a virtual environment
```commandline
python3 -m venv tutorial-env # this creates our Virtual Environment
```

```
python3 --version
```
This is to ensure python has been downloaded

```commandline
sudo apt-get install python3-pip -y
```
pip is a python 3 module which we installed above



While still inside the virtual environment we created, we can now download all the dependencies that we would need to run our app

```commandline
python3 -m pip install flask
python3 -m pip install flask-login
python3 -m pip install flask-sqlalchemy
```
We now navigate back into the app folder and run the following commands
```commandline
sudo python3 -m pip install flask
export FLASK_APP=project
python3 -m flask run -h 0.0.0.0
```

python3 is the software, -m refers to the module, and the module we have chosen to install is flask


# try do pip install requirements.txt
# Add reverse proxy configuration to default file just like the project we've just done
# Automate all these commands using bash scripts

