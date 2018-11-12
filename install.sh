#!/bin/bash
#####
# docker autoinstaller script for ubuntu linux 
# v.1
# 
# [https://docs.docker.com/install/linux/docker-ce/ubuntu/#set-up-the-repository]
####

echo "script: $0"
echo "workdir: $(dirname $0)"			# винтажный вариант `dirname $0`
echo "scriptname: $(basename $0)" # винтажный вариант `basename $0`
root=$(pwd) # аналогично `pwd` более модерновая версия
echo "working root: $root"
echo "$(lsb_release -cr)"

password=""
if [ -n "$1" ]              
then
	password=$1
	shift
	echo "password: $password"
else
	echo "You should define sudo password!"     
	echo "Usage: cmd <sudo-password>"
	exit 1
fi
##### DEBUG
#exit 0

echo
echo
echo "### Setting up the repository ###"
echo "#################################"
echo
echo "Updating the apt package index:"
echo $password | sudo -S apt-get update
echo
echo "Installing packages to allow apt to use a repository over HTTPS:"
echo $password | sudo -S apt-get install -y apt-transport-https ca-certificates curl software-properties-common
echo
echo "Adding Docker’s official GPG key:"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo
echo "Verifeing that you now have the key with the fingerprint" 
echo "  9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88" 
echo "by searching for the last 8 characters of the fingerprint."
echo
echo $password | sudo -S apt-key fingerprint 0EBFCD88
echo
echo "Use the following command to set up the stable repository."
echo $password | sudo -S add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo 
echo 
echo "### Installing Docker CE ###"
echo "############################"
echo
echo "Updating the apt package index"
echo $password | sudo -S apt-get update
echo
echo "Installing the latest version of Docker CE"
echo
echo $password | sudo -S apt-get install -y docker-ce
echo
echo "The Docker daemon starts automatically."
echo
echo "Verify that Docker CE is installed correctly by running the hello-world image."
echo
echo $password | sudo -S docker run hello-world
echo
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
echo "### Creating the docker group and add your user(\$USER\ ###"
echo "###########################################################"
echo
echo "Creating the docker group"
echo $password | sudo -S groupadd docker
echo
echo "Adding your user to the docker group"
echo $password | sudo -S usermod -aG docker $USER
echo
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
echo "When the container runs, it prints an informational message and exits."
echo
echo
echo "### Installing Compose on Linux systems ###"
echo "###########################################"
echo
echo "Downloading the latest version of Docker Compose"
echo $password | sudo -S curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
echo
echo "Applying executable permissions to the binary"
echo $password | sudo -S chmod +x /usr/local/bin/docker-compose
echo
echo
echo "$(docker --version)"
echo "$(docker-compose --version)"
echo
echo "That's it! :)"

exit 0


