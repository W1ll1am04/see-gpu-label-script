#!/bin/bash

# information
appname="see-vram-script download.sh"
description="see-vram-script's automated downloader."

#dependencies
mesa="mesa-utils"

[ "$UID" -eq 0 ] || exec sudo "$0" "$@"

# Update apt cache
echo Updating apt cache...
apt update >> /dev/null || echo Failed updating apt cache...

# Check for missing dependencies
if [ $(dpkg-query -W -f='${Status}' $mesa 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
	apt-get install $mesa --assume-yes >> /dev/null;
fi

# Checking if git is installed, if not installing it.
if [ $(dpkg-query -W -f='${Status}' git 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
	apt-get install git --assume-yes >> /dev/null;
else
	# Cloning into see-vram-script repository
	git clone https://github.com/W1ll1am04/see-vram-script
	echo -e "\n"
	FILE=see-vram-script
	if [ -d "$FILE" ]; then
		echo "Attempting to setup source with chmod.."
		cd see-vram-script
		chmod +x gpu.sh
	else
		echo "Cannot find source folder, You are going to have cmod source yourself."
	fi
fi
echo "Finished downloading..."
