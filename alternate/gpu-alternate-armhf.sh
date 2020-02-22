#!/bin/sh
clear
echo all the alternate scripts are waiting for updates, to the new gpu-sh.
echo see-vram-script For ARMHF. Make sure you download the correct script.
echo this version of the script is only designed for ARMHF.
echo https://github.com/W1ll1am04
echo  
echo Getting MESA-UTILS deb.
sudo wget http://ports.ubuntu.com/ubuntu-ports/pool/universe/m/mesa-demos/mesa-utils_8.4.0-1_armhf.deb
sudo dpkg -i mesa-utils_8.4.0-1_armhf.deb
sudo rm mesa-utils_8.4.0-1_armhf.deb
clear
echo Cleaning up..
echo Installed Package MESA-UTILS.
echo 
echo Show GPU Vram Script.
echo Made by W1ll1am on github: https://github.com/W1ll1am04
glxinfo | egrep -i 'device|memory'
