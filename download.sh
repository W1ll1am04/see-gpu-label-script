#!/bin/sh
clear
echo gpu.sh download script.
echo W1ll1am github: https://github.com/W1ll1am04
echo 
mkdir gpu-sh-script
cd gpu-sh-script
wget https://raw.githubusercontent.com/W1ll1am04/see-vram-script/master/gpu.sh
wget https://raw.githubusercontent.com/W1ll1am04/see-vram-script/master/gpu-alternate-arm64.sh
wget https://raw.githubusercontent.com/W1ll1am04/see-vram-script/master/gpu-alternate-armhf.sh
wget https://raw.githubusercontent.com/W1ll1am04/see-vram-script/master/gpu-alternate-powerpc.sh
wget https://raw.githubusercontent.com/W1ll1am04/see-vram-script/master/readme.md
echo gpu-sh family downloaded sucessfully.
chmod 777 gpu.sh
chmod 777 gpu-alternate-arm64.sh
chmod 777 gpu-alternate-armhf.sh
chmod 777 gpu-alternate-powerpc.sh
echo Finished downloading gpu.sh
echo 
echo you can now run it by typing: ./gpu.sh
