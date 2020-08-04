# Running A Flask Application On Nginx using a Virtual Machine

This repo will bring together many of the concepts that have previously been touched upon, we will work with;
- Flask
- Vagrant
- Ruby
- Virtual Box
- Git Bash

## Prerequisites for this Project


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
  config.vm.box = "ubuntu/xenial64"

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
In order for file to run, we would need to first snyc the VM directory with our OS directory and
then run this file. We will use the below code to do this by adding it to our vagrant file

```bash
app.vm.synced_folder "app", "/home/ubuntu/app"
# the below code run 
app.vm.provision "shell", path: "environment/app/provision.sh", privileged: false
```
