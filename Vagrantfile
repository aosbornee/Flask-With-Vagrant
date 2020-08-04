
Vagrant.configure("2") do |config|

 config.vm.define "app" do |app|

# creating an ubuntu virtual machine, here we are asking for the download of this specific vagrant box which can be found on vagrant cloud, this is not a fully fledge OS, just a stripped down version with the main functionalities 
  config.vm.box = "bento/ubuntu-20.04"

# Creating a private ip to access our nginx web server
  config.vm.network "private_network", ip: "192.168.10.200"
  
# redirecting the above IP ti a specific web address
  config.hostsupdater.aliases = ["flaskapp.local"]


  app.vm.synced_folder "app", "/home/ubuntu/app"
  app.vm.provision "shell", path: "environment/app/provision.sh", privileged: false

  end
end
