Vagrant.configure(2) do |config|
  config.vm.define "toronto-city-hall-api"
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 1337, host: 1337

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.berkshelf.berksfile_path = "chef/Berksfile"
  config.berkshelf.enabled = true

  config.vm.provision "chef_zero" do |chef|
    chef.add_recipe "apt"
    chef.add_recipe "git"
    chef.add_recipe "nodejs"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "city-hall-api::default"

    #chef.version = "11.18.12"
    chef.version = "12.3.0"
    chef.json = {
      postgresql: {
        password: {
          postgres: "sekret"
        }
      }
    }
  end

end
