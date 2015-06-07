# Explicitly set provider so we can access it later in the envvar.
ENV['VAGRANT_DEFAULT_PROVIDER'] = "virtualbox"

Vagrant.configure(2) do |config|
  machine_name = "toronto-city-hall-api"
  config.vm.define machine_name

  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 1337, host: 1337

  config.vm.provider "virtualbox" do |vbox|
    vbox.memory = 1024
    vbox.cpus = 4
  end

  # Optional plugin to speed up provisioning
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  unless Vagrant.has_plugin?("vagrant-berkshelf")
    output = "This Vagrant project requires the Berkshelf plugin. Please run: \n"
    output += "~$ vagrant plugin install vagrant-berkshelf"
    raise output
  end

  # Workaround required until this issue is resolved:
  # https://github.com/mitchellh/vagrant/issues/5199#issuecomment-73278236
  if Vagrant.has_plugin?("vagrant-triggers")
    config.trigger.before [:reload, :halt], stdout: true do
      Dir.chdir '..' while !File.exist?('Vagrantfile')
      `rm .vagrant/machines/#{machine_name}/#{ENV['VAGRANT_DEFAULT_PROVIDER']}/synced_folders`
    end
  else
    output =  "This Vagrant project requires the Triggers plugin. Please run: \n"
    output += "~$ vagrant plugin install vagrant-triggers"
    raise output
  end

  config.berkshelf.berksfile_path = "chef/Berksfile"
  config.berkshelf.enabled = true

  config.vm.provision "chef_zero" do |chef|
    chef.add_recipe "apt"
    chef.add_recipe "git"
    chef.add_recipe "nodejs"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "city-hall-api::default"
    chef.add_recipe "city-hall-api::pupa"

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
