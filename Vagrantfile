# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "chef/ubuntu-14.04"
  config.vm.define "server1" do |server|
      server.vm.hostname = "server1"
      server.vm.network "private_network", ip: "172.20.20.10"
      server.vm.network "forwarded_port", guest: 8500, host: 8500
      server.vm.provision "chef_solo" do |chef|
        chef.cookbooks_path = ["cookbooks","site-cookbooks"]
        chef.add_recipe "consul-demo"
        chef.add_recipe "consul-demo::kv"
        chef.json = {
          "consul" => {
	          "install_method" => "binary",
		  "servers" => ["172.20.20.11","172.20.20.12"],
		  "service_mode" => "cluster",
		  "serve_ui" => "true",
		  "bootstrap_expect" => "3",
		  "retry_on_join" => "true",
		  "bind_interface" => "eth1"
	    }
	  }
    end
  end

  config.vm.define "server2" do |server|
      server.vm.hostname = "server2"
      server.vm.network "private_network", ip: "172.20.20.11"
      server.vm.network "forwarded_port", guest: 8500, host: 8501
      server.vm.provision "chef_solo" do |chef|
        chef.cookbooks_path = ["cookbooks","site-cookbooks"]
        chef.add_recipe "consul-demo"
        chef.json = {
          "consul" => {
	          "install_method" => "binary",
		  "servers" => ["172.20.20.10","172.20.20.12"],
		  "service_mode" => "cluster",
		  "serve_ui" => "true",
		  "bootstrap_expect" => "3",
		  "retry_on_join" => "true",
		  "bind_interface" => "eth1"
	    }
	  }
    end
  end

  config.vm.define "server3" do |server|
      server.vm.hostname = "server3"
      server.vm.network "private_network", ip: "172.20.20.12"
      server.vm.network "forwarded_port", guest: 8500, host: 8502
      server.vm.provision "chef_solo" do |chef|
        chef.cookbooks_path = ["cookbooks","site-cookbooks"]
        chef.add_recipe "consul-demo"
        chef.json = {
          "consul" => {
	          "install_method" => "binary",
		  "servers" => ["172.20.20.10","172.20.20.11"],
		  "service_mode" => "cluster",
		  "serve_ui" => "true",
		  "bootstrap_expect" => "3",
		  "retry_on_join" => "true",
		  "bind_interface" => "eth1"
	    }
	  }
    end
  end

  config.vm.define "client1" do |client|
      client.vm.hostname = "client1"
      client.vm.network "private_network", ip: "172.20.20.13"
      client.vm.provision "chef_solo" do |chef|
        chef.cookbooks_path = ["cookbooks","site-cookbooks"]
        chef.add_recipe "consul-demo"
        chef.add_recipe "consul-demo::jenkins"
	chef.log_level = :debug
        chef.json = {
          "consul" => {
	          "install_method" => "binary",
		  "servers" => ["172.20.20.10","172.20.20.11","172.20.20.12"],
		  "service_mode" => "client",
		  "retry_on_join" => "true",
		  "bind_interface" => "eth1"
	    }
	  }
    end
  end
end
