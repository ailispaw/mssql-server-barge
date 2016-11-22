# A dummy plugin for Barge to set hostname and network correctly at the very first `vagrant up`
module VagrantPlugins
  module GuestLinux
    class Plugin < Vagrant.plugin("2")
      guest_capability("linux", "change_host_name") { Cap::ChangeHostName }
      guest_capability("linux", "configure_networks") { Cap::ConfigureNetworks }
    end
  end
end

SA_PASSWORD = "Your@Strong@Password"

Vagrant.configure(2) do |config|
  config.vm.define "mssql-server-barge"

  config.vm.box = "ailispaw/barge"

  config.vm.provider :virtualbox do |vb|
    vb.memory = 4096
  end

  config.vm.synced_folder ".", "/vagrant", id: "vagrant"

  config.vm.network :forwarded_port, guest: 1433, host: 1433

  config.vm.provision :docker do |d|
    #d.build_image "/vagrant", args: "-t ailispaw/mssql-server-linux"
    d.pull_images "ailispaw/mssql-server-linux"
    d.run "mssql-server",
      image: "ailispaw/mssql-server-linux",
      args: [
        "-p 1433:1433",
        "-e SA_PASSWORD=#{SA_PASSWORD}"
      ].join(" ")
  end
end
