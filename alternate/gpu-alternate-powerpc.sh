#!/bin/sh
clear
echo all the alternate scripts are waiting for updates, to the new gpu-sh.
echo this script is for POWERPC only.
echo https://github.com/W1ll1am04
echo 
echo Getting MESA-UTILS deb.
wget http://ports.ubuntu.com/ubuntu-ports/pool/universe/m/mesa-demos/mesa-utils_8.1.0-2_powerpc.deb
sudo dpkg -i mesa-utils_8.1.0.2_powerpc.deb
sudo rm mesa-utils_8.1.0.2_powerpc.deb
clear
echo Cleaning up...
echo Installed Package MESA-UTILS
echo 
echo Show GPU Vram Script.
echo https://github.com/W1ll1am04
glxinfo | egrep -i 'device|memory'
