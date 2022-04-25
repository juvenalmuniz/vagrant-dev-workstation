# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
# Opcional para vagrant ssh: 
# Trocar o usuário após o primeiro provisionamento para o usuário abaixo
#  config.ssh.username = "juvenal.muniz"
  config.ssh.insert_key = false
  config.ssh.private_key_path = [
    "~/.ssh/id_rsa",
    "~/.vagrant.d/insecure_private_key"
  ]
  config.vm.box = "ubuntu/focal64"
  config.vm.host_name = "dev.local"
  config.vm.network "private_network", ip: "192.168.56.3"
  config.vm.synced_folder "./data", "/vagrant_data"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "512"
  end
  # Caso o host tenha ansible instalado
  #config.vm.provision "ansible", playbook: "ubuntu.yml"
  # Para criar um usuário dev é preciso provisionar manualmente:
  # vagrant provision --provision-with createuser
  config.vm.provision "createuser", type: "shell", run: "never" do |s|
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
    s.path = "createuser.sh"
    s.privileged = true
    s.args = ["juvenal.muniz", ssh_pub_key]
  end
  # Esse provisionamento para instalar pacotes sempre será executado com:
  # vagrant provision
  config.vm.provision "deps", type: "shell" do |s|
    s.path = "deps.sh"
    s.privileged = true
  end
end
