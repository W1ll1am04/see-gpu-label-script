#!/bin/sh
clear
echo gpu.sh download script.
echo W1ll1am04 github: https://github.com/W1ll1am04
echo 
mkdir gpu-sh-script
cd gpu-sh-script
wget -q - https://raw.githubusercontent.com/W1ll1am04/see-vram-script/master/gpu.sh >>NULL
FILE=gpu.sh
if [ -f "$FILE" ]; then
	    echo "$FILE Sucessfully downloaded."
else
	echo "Download for $FILE Failed!!..."

    fi
wget -q - https://raw.githubusercontent.com/W1ll1am04/see-vram-script/master/gpu-alternate-arm64.sh >>NULL
GFILE=gpu-alternate-arm64.sh
if [ -f "$GFILE" ]; then
	    echo "$GFILE Suessfully downloaded."
    
else
	echo "Download for $GFILE Failed!!..."
    
    fi
wget -q - https://raw.githubusercontent.com/W1ll1am04/see-vram-script/master/gpu-alternate-armhf.sh >>NULL
GSC=gpu-alternate-armhf.sh
if [ -f "$GSC" ]; then
	    echo "$GSC Sucessfully downloaded."

else
	echo "Download for $GSC Failed!!..."

    fi
wget -q - https://raw.githubusercontent.com/W1ll1am04/see-vram-script/master/gpu-alternate-powerpc.sh >>NULL
GPPC=gpu-alternate-powerpc.sh
if [ -f "$GPPC" ]; then
	    echo "$GPPC Sucessfully downloaded."
    
else
	echo "Download for $GPPC Failed!!..."
    
    fi
wget -q - https://raw.githubusercontent.com/W1ll1am04/see-vram-script/master/README.md >>NULL
RDME=README.md
if [ -f "$RDME" ]; then
	    echo "$RDME Sucessfully downloaded."
    
else
	echo "Download for $RDME Failed!!..."
    
    fi
echo 
echo 
echo Running CHMOD...
chmod 777 gpu.sh >>NULL
chmod 777 gpu-alternate-arm64.sh >>NULL
chmod 777 gpu-alternate-armhf.sh >>NULL
chmod 777 gpu-alternate-powerpc.sh >>NULL
echo 
echo 
echo Finished downloading gpu.sh
echo  
echo 
echo you can now run it by typing *cd gpu-sh-script* Then: *./gpu.sh* or alternativly run the alternate scripts.
