#!/bin/bash

# define strings & bools
dep="lshw"
req_su=true
gpu_only=false
chip_only=false

function display_help() {
  echo "usage: ./gpu.sh [arg]"
  echo "A tool to see your gpu's name."
  echo "Arguments & usage, and an explanation: "
  echo
  echo "-h, --help        display this message."
  echo "-n, --no-su       dont request superuser permission."
  echo "-g, --gpu-only    display gpu label only."
  echo "-c, --chip        display chip label only."
}

# parse arguments
if [ $# -eq 0 ]
then
  true
else
  if [ "$1" == "--help" ] || [ "$1" == "-h" ]
  then
    display_help
    exit
  # yes yes i know i should do two args at once. i will eventually do it (:
  else if [ "$1" == "--no-su" ] || [ "$1" == "-n" ]
  then
    req_su=false
  else if [ "$1" == "--gpu-only" ] || [ "$1" == "-g" ]
  then
    gpu_only=true
  else if [ "$1" == "--chip" ] || [ "$1" == "-c" ]
  then
    chip_only=true
  else
    echo "Unknown parameter: '$1'"
    echo "Use -h for more information."
    exit
  fi
  fi
  fi
  fi
fi

function credit() {
  echo "see-vram-script."
  echo "https://github.com/W1ll1am04"
  echo ""
  return 0;
}

# check if 'lshw' is installed, if it isnt install it. Because this whole script relies on lshw.
if [ $(dpkg-query -W -f='${Status}' $dep 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  gpu_only=false
  credit
  echo "Installing $dep"
  if sudo apt-get install $dep >> /dev/null;
  then
    echo "Done installing $dep"
    echo
  else
    echo "Failed installing $dep, you will have to manually install it."
    echo
  fi
fi 
if [ "$gpu_only" = false ] ; 
then
  credit
fi

# checking whenever to use sudo or not.
if [ "$req_su" = true ] ; 
then
  gpu_command=`sudo lshw -short | grep -i --color display`
else
  gpu_command=`lshw -short | grep -i --color display`
fi

# Splitting away spaces & brackets.

readarray -d "y" -t strarr <<< "$gpu_command"
readarray -d "[" -t almost <<< "${strarr[1]}"
readarray -d "]" -t gpu <<< "${almost[1]}"
if [ "$chip_only" = true ] ; 
then
  split_space=(${almost[0]})
  echo "${split_space[0]}"
else
  if [ "$gpu_only" = true ] ; 
  then
    echo -e "$gpu"
  else
    echo -e "GPU: $gpu"
fi
fi