#!/bin/sh
clear
dep="mesa-utils"
echo see-vram-script.
echo https://github.com/W1ll1am04
echo  
if [ $(dpkg-query -W -f='${Status}' $dep 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo Installing MESA-UTILS
  sudo apt-get install $dep;
  echo Done installing MESA-UTILS
fi
clear
echo 
echo see-vram-script
echo https://github.com/W1ll1am04
echo 
gpu=`sudo lshw -short | grep -i --color display`

readarray -d "y" -t strarr <<< "$gpu"
echo "GPU:${strarr[1]}"
