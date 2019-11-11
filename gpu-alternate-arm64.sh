#!/bin/sh
clear
echo GPU Vram Script For ARM64. Make sure you run the correct script.
echo this version of the script is only designed for ARM64.
echo Made by W1ll1am on github: https://github.com/W1ll1am04
echo  
echo Getting MESA-UTILS deb.
sudo wget http://ports.ubuntu.com/ubuntu-ports/pool/universe/m/mesa-demos/mesa-utils_8.4.0-1_arm64.deb
dpkg -i mesa-utils_8.4.0-1_arm64.deb
clear
echo Installed Package MESA-UTILS.
echo 
echo Show GPU Vram Script.
echo Made by W1ll1am on github: https://github.com/W1ll1am04
glxinfo | egrep -i 'device|memory'
