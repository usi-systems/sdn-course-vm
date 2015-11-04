## Vagrantfile for SDN Course 2015

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.box = "ubuntu/trusty64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.

 
 ## Guest Config
 config.vm.hostname = "usi-sdn"
 config.vm.network :private_network, ip: "192.168.0.100"
 #config.vm.network :forwarded_port, guest:6633, host:6635 # forwarding of port 
 
 ## Provisioning
 config.vm.provision :puppet
 config.vm.provision :shell, privileged: false, :path => "setup/p4-setup.sh"
 #config.vm.provision :shell, privileged: false, :path => "setup/p4tut-setup.sh"
 #config.vm.provision :shell, privileged: false, :path => "setup/spin-setup.sh"
 #config.vm.provision :shell, privileged: false, :path => "setup/datalog-setup.sh"

 ## SSH config
 config.ssh.forward_x11 = true

 ## CPU & RAM
 ## We need at least 2G to build P4, otherwise you run out of memmory 
 config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
    vb.memory = 2048
    vb.cpus = 2
 end

end
