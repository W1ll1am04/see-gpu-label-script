#!/bin/sh
clear
echo GPU Vram Script For ARMHF. Make sure you download the correct script.
echo this version of the script is only designed for ARMHF.
echo Made by W1ll1am on github: https://github.com/W1ll1am04
echo  
echo Getting MESA-UTILS deb.
sudo wget http://ports.ubuntu.com/ubuntu-ports/pool/universe/m/mesa-demos/mesa-utils_8.4.0-1_armhf.deb
dpkg -i mesa-utils_8.4.0-1_armhf.deb
clear
echo Installed Package MESA-UTILS.
echo 
echo Show GPU Vram Script.
echo Made by W1ll1am on github: https://github.com/W1ll1am04
glxinfo | egrep -i 'device|memory'