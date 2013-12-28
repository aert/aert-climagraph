# -*- mode: ruby; -*-
# vi: set ft=ruby :

# climagraph_" + INSTALLER_VERSION + "_setup.tgz"
INSTALLER_VERSION = IO.read("./RELEASE-VERSION").rstrip
INSTALLER_DIR = File.join(File.dirname(__FILE__), "build")

Vagrant.configure("2") do |config|
  # Debian Wheezy
  config.vm.box = "wheezy64"
  config.vm.box_url = "http://downloads.shadoware.org/wheezy64.box"

  # Network
  config.vm.network :private_network, ip: "192.168.111.228"
  config.vm.hostname = "climagraph.vagrant.local"
  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
  config.vm.network :forwarded_port, guest: 5432, host: 5432

  #config.vm.synced_folder "../", "/home/vagrant/PROJECT"

  # Provision
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "deploy/ansible/playbook.yml"
    ansible.inventory_path = "deploy/ansible/inventory.ini"
    extra_vars = { 
                    app_servername: "192.168.111.228",
                    installer_version: INSTALLER_VERSION,
                    installer_dir: INSTALLER_DIR,
                    with_fixtures: "1"
                 }
    ansible.raw_arguments = "--extra-vars=" + extra_vars.map { |k,v| "#{k}=#{v}" }.join(" ")
  end

  # Customize the box
  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 512, "--name", "climagraph"]
  end

end

