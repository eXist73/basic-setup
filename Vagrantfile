
Vagrant.configure(2) do |config|

  config.vm.box = "laravel/homestead"

  config.vm.network "private_network", ip: "192.168.50.13"

  config.vm.synced_folder "./", "/var/www/html", :owner => 'vagrant', :group => 'www-data'

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  config.vm.provision "shell", path: "./provision.sh"

end
