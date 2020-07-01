#!/bin/bash

dep="lshw"
dep2="sed"
req_su=true
gpu_only=false
sdt=true

function usage() {
  echo "usage: ./gpu.sh [OPTION]... [OPTION]... [OPTION]..."
  echo "A tool to see your gpu's label."
  echo "Arguments & usage, and an explanation: "
  echo
  echo "-h, --help            display this message."
  echo "-n, --no-su           dont request superuser permission."
  echo "-g, --gpu-only        display gpu label only."
  echo "-s, --skip-dep-test   skip dependency test and just run the program."
}

function dependency_test() {
  # check if 'lshw' is installed, if it isnt install it. Because the whole script relies on 'lshw' to get gpu information.
  if [ $(dpkg-query -W -f='${Status}' $dep 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo "Installing $dep"
    if sudo apt-get install $dep >> /dev/null;
    then
      echo "Done installing $dep"
      echo
    else
      echo "Failed installing $dep, you will have to manually install $dep."
      echo
    fi
  fi 

  # check if 'sed' is installed, if it isnt install it. Because the splitting relies on 'sed'.
  if [ $(dpkg-query -W -f='${Status}' $dep2 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo "Installing $dep2"
    if sudo apt-get install $dep2 >> /dev/null;
    then
      echo "Done installing $dep2"
      echo
    else
      echo "Failed installing $dep2, you will have to manually install $dep."
      echo
    fi
  fi 
}

# parse arguments
if [ $# -eq 0 ]
then
  true
else
  for arg in "$@"; do
    shift
    case "$arg" in
      "--help") set -- "$@" "-h" ;;
      "--no-su") set -- "$@" "-n" ;;
      "--gpu-only")   set -- "$@" "-g" ;;
      "--skip-dep-test")   set -- "$@" "-s" ;;
      *)        set -- "$@" "$arg"
    esac
  done

  while getopts "hngs" options; do
    case "${options}" in
      h)
        usage
        exit
        ;;
      n)
        req_su=false
        ;;
      g)
        gpu_only=true
        ;;
      s)
        sdt=false
        ;;
    esac
  done
fi

function credit() {
  echo "see-vram-script."
  echo "https://github.com/W1ll1am04"
  echo ""
}

if [ "$sdt" = true ]
then
  dependency_test
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
gpu=`echo ${strarr[1]} | sed 's/ *$//g'`

if [ "$gpu_only" = true ] ; 
then
  if [ -z "$gpu" ]
  then
    echo "Unable to get GPU label."
  else
    echo -e "$gpu"
  fi
else
  if [ -z "$gpu" ]
  then
    echo "Unable to get GPU label."
  else
    echo -e "GPU: $gpu"
  fi
fi
