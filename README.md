Openshift DevOps Demo
========================

A complete DevOps circuit with CI/CD and repository management intendid for educational and demonstrational purposes.  

![GitHub Logo](/slides/05.png)

Tool Chain
----------

The current tool chanin includes Red Hat's Openshift Origin Platform As A Service (PAAS), Jenkins Continuous Integration, Nexus repository manager, Git source control management and Maven project manager.  Later versions with ship with testing suites like Sonar Cube and Selenium.  

Installation Prerequisites
---------------------------

You will need to provision two minimal virtual machines.  One for the Openshift private cloud and a second machine for the DevOps Circuit.

```
OPENSHIFT

Operating System: CentOS 6
Hosname: cloud.example.com
IP Address: 192.168.122.2
```

```
DEVOPS CICUIT

Operating System: CentOS 7
Hostname: devops.example.com
IP Address: 192.168.122.3
``` 

For more information about virtualization see below:

CentOS http://wiki.centos.org/HowTos#head-fb1ff7e71fb5f2f511cda8c68cb6ba5f6e8decae 

It is recommended that the system be updated before beginning the installation.  A fast internet connection is also required in order to facilitate the downloading of any package dependancies.  The following command string can be used on a vanilla system.
```
# Install Openshift Cloud
yum -y update && yum -y install git && mkdir ~/workspace && cd ~/workspace && git clone https://github.com/sbadakhc/ose-devops-demo && cd ./ose-devops-demo && ./cloud
```

```
# Install DevOps Circuit
yum -y update && yum -y install git && mkdir ~/workspace && cd ~/workspace && git clone https://github.com/sbadakhc/ose-devops-demo && cd ./ose-devops-demo && ./devops
```


Minimum System Requirements
--------------------------- 

The virtual machine is configured with the following default specifications:

1. 4GB RAM
2. 2xVCPU
3. 8GB Disk Space

Installation Instructions
------------------------

Checkout the contents of the devops demo git repository to a suitable directory on your host.
```
[root@localhost]# cd ~/workspace
[root@localhost]# git clone https://github.com/sbadakhc/ose-devops-demo
```

As the root user execute the install script.  
```
[root@localhost]# cd ~/ose-devops-demo
[root@localhost]# ./install
```
Once the installation is complete you will need to update the Openshift user credentials and upload the ssh keys.  Browse to http://devops.example.com:9080/jenkins and go to Manage Jenkins > Configure System. Scroll down to OpenShift section and enter your the username "demo" and password "openshift" in the respective textboxes. If using OpenShift Enterprise. Click on "Check Login" to validate your username and password. If successfull, click on "Upload SSH Public Key" to upload the Jenkins SSH keys to OpenShift.

You will also have to configure the git scm via the web gui interface (see configuration notes below).
 
Configuration Notes
-------------------
Openshift: https://cloud.example.com:8443
username: demo
password: openshift

Jenkins: http://devops.example.com:8080
username: admin
password: admin

Nexus: http://devops.example.com:8081
username: admin
password: admin123

Git: http://devops.example.com:3000

Known Issues
-----------------------------------

1. When downloading the Jenkins plugins timeouts can occur causing an incomplete installation.  You will have to follow reinstall jenkins and re-run the installation script.
```
[root@localhost]# service jenkins stop ; rm -rf /var/lib/jenkins* /var/log/jenkins/ /var/run/jenkins.pid /etc/sysconfig/jenkins* && yum -y reinstall jenkins ; service jenkins start
[root@localhost]# ~/workspace/ose-devops-demo/jenkins/jenkins
```

Bug Reports
-----------

Please follow this template while reporting an issue:

Component: Host, Guest (OS version), Openshift, Jenkins etc.

Description: Description of the problem

Steps to reproduce: Instructions on how to reproduce the issue, as an ordered list

Expected result: The result that was expected

Actual result: The actual result including error messages, exceptions etc.

See http://github.com/sbadakhc/ose-devops-demo/issues?state=open

