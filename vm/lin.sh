#!/bin/sh
#
# Copyright (C) 2015 Red Hat Inc.
# Author: Salim Badakhchani <sal@redhat.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
########################################################################

# Uncomment to debug script
#set -x

# Check user priviledges
if [ "$USER" != "root" ]; then
    echo -e "\n# This script requires root priviledges to run"
exit
fi

VM_HOME="${HOME}/workspace/ose-devops-vm"

echo -e "# Checking for VirtualBox and Vagrant packages"
[[ ! "$(rpm -qa | grep vagrant)" ]] && yum -y install https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.5_x86_64.rpm
if [ ! $(which VBoxManage) ]
then
    [[ ! -f /etc/yum.repos.d/virtualbox.repo ]] && wget -P /etc/yum.repos.d/ http://download.virtualbox.org/virtualbox/rpm/$OS/virtualbox.repo
    yum -y install VirtualBox kmod-VirtualBox
fi


echo -e "# Installing vm in ${VM_HOME}"
[[ -d ${VM_HOME} ]] && rm -rf ${VM_HOME}
mkdir -p ${VM_HOME}
cd ${VM_HOME}

echo -e "# Initialising virtual machine"
vagrant box add base https://github.com/tommy-muehle/vagrant-box-centos-6.6/releases/download/1.0.0/centos-6.6-x86_64.box
vagrant init
vagrant up
vgrant ssh
