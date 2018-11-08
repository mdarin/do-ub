#!/bin/bash
#
# docker unistaller script
#


password=""
if [ -n "$1" ]              
then
	password=$1
	shift
	echo "password: $password"
else
	echo "You should define sudo password!"     
	exit 1
fi

echo "### Uninstalling the Docker CE package ###"
echo "##########################################"

echo $password | sudo -S apt-get purge -y docker-ce

echo "Images, containers, volumes, or customized configuration files on your host are not automatically removed."
echo "To delete all images, containers, and volumes"

echo $password | sudo -S  rm -rf /var/lib/docker

echo "WARNING! You must delete any edited configuration files manually."
echo $password | sudo -S  apt autoremove -y
