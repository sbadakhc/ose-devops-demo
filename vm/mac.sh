# Install virtualbox
http://download.virtualbox.org/virtualbox/4.3.18/VirtualBox-4.3.18-96516-OSX.dmg
hdiutil attach VirtualBox-4.3.18-96516-OSX.dmg
sudo installer -pkg /Volumes/VirtualBox/VirtualBox.pkg -target /
hdiutil detach /Volumes/VirtualBox

# Install vagrant
curl -L -O https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2.dmg;
hdiutil attach vagrant_1.7.2.dmg;
sudo installer -pkg /Volumes/Vagrant/Vagrant.pkg -target /
hdiutil detach /Volumes/Vagrant

# Run Vagrant
vagrant box add base https://github.com/tommy-muehle/vagrant-box-centos-6.6/releases/download/1.0.0/centos-6.6-x86_64.box
vagrant init
vagrant up
vgrant ssh
