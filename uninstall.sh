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
	echo "Usage: cmd <sudo-password>"
	exit 1
fi

echo
echo
echo "### Uninstalling the Docker CE package ###"
echo "##########################################"
echo
echo $password | sudo -S apt-get purge -y docker-ce
echo
echo "Images, containers, volumes, or customized configuration files on your host are not automatically removed."
echo "To delete all images, containers, and volumes"
echo $password | sudo -S rm -rf /var/lib/docker
echo
echo "Deleting \'docker\' group"
echo $password | sudo -S groupdel docker
echo
#echo "Excluding $USER from \'docker\' group"
#echo $password | sudo -S gpasswd -d $USER docker
#TODO update groups of $USER
echo
echo "Cleaning up"
echo
echo $password | sudo -S apt autoremove -y
echo
echo
echo "### Uninstalling the Docker Compose ###"
echo "#######################################"
echo
echo "Uninstalling Docker Compose this way because it had installed using curl"
echo $password | sudo -S rm /usr/local/bin/docker-compose
echo
echo "Checking uninstallion completion by asking version"
echo
echo "$(docker --version)"
echo "$(docker-compose --version)"
echo
echo
echo "WARNING! You must delete any edited configuration files manually."
echo
echo

exit 0
