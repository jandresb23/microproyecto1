# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

 config.vm.define :clienteUbuntu1 do |clienteUbuntu1|
  clienteUbuntu1.vm.box = "bento/ubuntu-22.04"
  clienteUbuntu1.vm.network :private_network, ip: "192.168.100.2"
  clienteUbuntu1.vm.hostname = "clienteUbuntu1"
  clienteUbuntu1.vm.provision "shell", path: "provision_cliente1.sh"
 end

 config.vm.define :clienteUbuntu2 do |clienteUbuntu2|
  clienteUbuntu2.vm.box = "bento/ubuntu-22.04"
  clienteUbuntu2.vm.network :private_network, ip: "192.168.100.4"
  clienteUbuntu2.vm.hostname = "clienteUbuntu2"
  clienteUbuntu2.vm.provision "shell", path: "provision_cliente2.sh"
 end

 config.vm.define :servidorUbuntu do |servidorUbuntu|
  servidorUbuntu.vm.box = "bento/ubuntu-22.04"
  servidorUbuntu.vm.network :private_network, ip: "192.168.100.3"
  servidorUbuntu.vm.hostname = "servidorUbuntu"
  servidorUbuntu.vm.provision "shell", path: "provision_servidor.sh"
 end
end

