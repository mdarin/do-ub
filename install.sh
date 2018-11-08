#!/bin/bash
#####
# docker autoinstaller script for ubuntu linux 
# v.1
# 
# [https://docs.docker.com/install/linux/docker-ce/ubuntu/#set-up-the-repository]
####

echo
echo "$(lsb_release -cr)"
echo 
#sleep 1

echo "sudo exmaple:"
echo "echo \$passwd | sudo -S apt-get install -y git"

echo "### Setting up the repository ###"
echo "#################################"
echo "Updating the apt package index:"

echo "$ sudo apt-get update"

echo "Installing packages to allow apt to use a repository over HTTPS:"

echo "$ sudo apt-get install apt-transport-https ca-certificates curl software-properties-common"

echo "Adding Docker’s official GPG key:"

echo "$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"

echo "Verifeing that you now have the key with the fingerprint" 
echo "  9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88" 
echo "by searching for the last 8 characters of the fingerprint."

echo "$ sudo apt-key fingerprint 0EBFCD88"

echo "Use the following command to set up the stable repository."

echo "$ sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\""

echo 
echo 

echo "### Installing Docker CE ###"
echo "############################"

echo "Updating the apt package index"

echo "$ sudo apt-get update"

echo "Installing the latest version of Docker CE"

echo "$ sudo apt-get install docker-ce"

echo "The Docker daemon starts automatically."

echo "Verify that Docker CE is installed correctly by running the hello-world image."

echo "$ sudo docker run hello-world"

echo "This command downloads a test image and runs it in a container."
echo "When the container runs, it prints an informational message and exits."
echo 
echo 

echo "Docker CE is installed and running now."
echo "The docker group is created but no users are added to it."
echo "You need to use sudo to run Docker commands."
echo 
echo "Continue to Linux postinstall to allow non-privileged users to"
echo "run Docker commands and for other optional configuration steps."
 
echo
echo
echo "####Creating the docker group and add your user\(\$USER\)###"
echo "############################################################"

echo "Creating the docker group"

echo "$ sudo groupadd docker"

echo "Adding your user to the docker group"

echo "$ sudo usermod -aG docker $USER"

echo "Log out and log back in so that your group membership is re-evaluated."
echo
echo "If testing on a virtual machine, it may be necessary to restart the virtual machine for changes to take effect."
echo
echo "On a desktop Linux environment such as X Windows, log out of your session completely and then log back in."
echo
echo "Verify that you can run docker commands without sudo."
echo 
echo "$ docker run hello-world"
echo
echo "This command downloads a test image and runs it in a container."
echo " When the container runs, it prints an informational message and exits."
echo "That's it! :)"
