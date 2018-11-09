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

echo
echo
echo "### Uninstalling the Docker CE package ###"
echo "##########################################"
echo
echo $password | sudo -S apt-get purge -y docker-ce

echo "Images, containers, volumes, or customized configuration files on your host are not automatically removed."
echo "To delete all images, containers, and volumes"
echo $password | sudo -S rm -rf /var/lib/docker

echo $password | sudo -S apt autoremove -y

echo
echo
echo "### Uninstalling the Docker Compose ###"
echo "#######################################"
echo
echo "Uninstalling Docker Compose this way because it had installed using curl"

echo $password | sudo -S rm /usr/local/bin/docker-compose

echo
echo "WARNING! You must delete any edited configuration files manually."
echo
echo
