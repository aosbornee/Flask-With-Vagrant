# Loading A Flask Application On The Web Using Vagrant

## Introduction
In this project we will use Mode View Controller To project our code onto a web browser, instead of running the app
within our Operating System, we will create a DEV environment using linux and run our Flask App here

## Prerequisites
Please ensure you have the following software's downloaded

1. [Ruby](https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.6.6-1/rubyinstaller-devkit-2.6.6-1-x64.exe)
2. [Vagrant](https://releases.hashicorp.com/vagrant/)
3. [Virtual Box](https://www.virtualbox.org/wiki/Downloads)

As we are creating the Application inside our VM, there is no need to have python or flask downloaded locally

## Prerequisite Check
- ```vagrant --version```
- ```ruby --version```


## Running the Virtual Machine

- Now that we are within the project folder, we will run the following command
```commandline
vagrant up
```

## Navigating To The Web Pages
Navigate to the application using the URL below, from here we have full fledged access to navigate to all pages
```commandline
http://flaskapp.local/
```