rem ==== OSE DEMO ====
..\bin\wget.exe "http://download.virtualbox.org/virtualbox/4.3.18/VirtualBox-4.3.18-96516-Win.exe"
VirtualBox-4.3.18-96516-Win.exe -extract
cd C:\Users\%username%\AppData\Local\Temp\VirtualBox
msiexec /i VirtualBox-4.3.18-r96516-MultiArch_%processor_architecture%.msi

rem ==== OSE DEMO ====
msiexec /i "http://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.5.msi"

cd C:%homepath%

vagrant init chef/centos-6.5
vagrant up
vagrant ssh
