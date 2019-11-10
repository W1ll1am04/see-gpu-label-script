#!/bin/sh
clear
echo GPU Vram Script.
echo Made by W1ll1am on github: https://github.com/W1ll1am04
echo  
echo Installing MESA-UTILS
sudo apt-get install mesa-utils
echo 
clear
echo Show GPU Vram Script.
echo Made by W1ll1am on github: https://github.com/W1ll1am04
echo Done installing MESA-UTILS
echo 
glxinfo | egrep -i 'device|memory'
