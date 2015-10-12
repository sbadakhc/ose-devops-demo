Openshift DevOps Demo
========================

A complete DevOps circuit with CI/CD and repository management intendid for educational and demonstrational purposes.  

![GitHub Logo](/slides/05.png)

Tool Chain
----------

The current tool chanin includes Red Hat's Openshift Origin Platform As A Service (PAAS), Jenkins Continuous Integration, Nexus repository manager and Maven project manager.  Later versions with ship with Go Git scm and testing suites like Sonar Cube and Selenium.  

Installation Prerequisites
---------------------------

It not recommended that you install directly on your workstation. Instead a virtual machine should be provisioned running CentOS 6.  You should create the virtual machine with the hostname devops.example.com.  

For more information about virtualization see below:

CentOS http://wiki.centos.org/HowTos#head-fb1ff7e71fb5f2f511cda8c68cb6ba5f6e8decae 

It is recommended that the system be updated before beginning the installation.  A fast internet connection is also required in order to facilitate the downloading of any package dependancies.  The following command string can be used on a vanilla system.
```
yum -y update && yum -y install git && mkdir ~/workspace && cd ~/workspace && git clone https://github.com/sbadakhc/ose-devops-demo && cd ./ose-devops-demo && ./install
```

Minimum System Requirements
--------------------------- 

The virtual machine is configured with the following default specifications:

1. 4GB RAM
2. 8GB Disk Space

Installation Instructions
------------------------

Checkout the contents of the devops demo git repository to a suitable directory on your host.
```
[root@localhost]# cd ~/workspace
[root@localhost]# git clone https://github.com/sbadakhc/ose-devops-demo
```

As the root user execute the install kojak script.  
```
[root@localhost]# cd ~/ose-devops-demo
[root@localhost]# ./install
```
Once the installation is complete you will need to update the Openshift user credentials and upload the ssh keys.  Browse to http://devops.example.com:9080/jenkins and go to Manage Jenkins > Configure System. Scroll down to OpenShift section and enter your the username "demo" and password "openshift" in the respective textboxes. If using OpenShift Enterprise. Click on "Check Login" to validate your username and password. If successfull, click on "Upload SSH Public Key" to upload the Jenkins SSH keys to OpenShift.
 
Configuration Notes
-------------------
Openshift console is accessbile via https://devops.example.com:8443
username: demo
password: openshift

Jenkins GUI via http://devops.example.com:9080
username: admin
password: admin

Nexus repository manager is available via http://devops.example.com:9081
username: admin
password: admin123

Known Issues
-----------------------------------

Please follow this template while reporting an issue:

Component: Host, Guest (OS version), Openshift, Jenkins etc.

Description: Description of the problem

Steps to reproduce: Instructions on how to reproduce the issue, as an ordered list

Expected result: The result that was expected

Actual result: The actual result including error messages, exceptions etc.

See http://github.com/sbadakhc/ose-devops-demo/issues?state=open

