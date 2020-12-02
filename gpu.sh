#!/bin/bash

declare -a dependencies=( "lshw" "sed" )

req_su=true
gpu_only=false
skip_dep_test=false
rconfig=false

# shellcheck source=/dev/null
source "$(dirname "$0")/misc.sh"

# shellcheck source=/dev/null
source "$(dirname "$0")/config_handler.sh"

function usage() {
  echo "usage: ./gpu.sh [OPTION]... [OPTION]... [OPTION]..."
  echo "A tool to see your gpu's label."
  echo "Arguments & usage, and an explanation: "
  echo -e "\nOptions: "
  echo "-h, --help              display this message."
  echo "-n, --no-su             dont request superuser permission."
  echo "-g, --gpu-only          display gpu label only."
  echo "-s, --skip-dep-test     skip dependency test and just run the program."
  echo "-r  --reset-config      reset the current config file."
}

function credit() {
  echo "see-vram-script."
  echo "https://github.com/W1ll1am04"
  echo ""
}

# parse arguments
if [ $# -eq 0 ]; then
  true
else
  for arg in "$@"; do
    shift
    case "$arg" in
      "--help") set -- "$@" "-h" ;;
      "--no-su") set -- "$@" "-n" ;;
      "--gpu-only")   set -- "$@" "-g" ;;
      "--skip-dep-test")   set -- "$@" "-s" ;;
      "--reset-config")   set -- "$@" "-r" ;;
      *)        set -- "$@" "$arg"
    esac
  done

  while getopts "hngsr" options; do
    case "${options}" in
      h)
        usage 2> >(errorHandle);
        exit
        ;;
      n)
        req_su=false 2> >(errorHandle);
        ;;
      g)
        gpu_only=true 2> >(errorHandle);
        ;;
      s)
        skip_dep_test=false 2> >(errorHandle);
        ;;
      r)
        rconfig=true 2> >(errorHandle);
        ;;
      *)
      ;;
    esac
  done
fi

# if resetconfig is true, then resetconfig. #
if [ "$rconfig" = true ]; then
  resetConfig > >(errorHandle)
fi

# test for required dependencies #
if [ "$skip_dep_test" = true ]; then
  for deps in "${dependencies[@]}"; do
    dependency_test "$deps" 2> >(errorHandle);
  done
fi

# Show credit if gpu only is false. #
if [ "$gpu_only" = false ]; then
  credit 2> >(errorHandle);
fi

# checking whenever to use sudo or not. #
if [ "$req_su" = true ]; then
  gpu_command=$(sudo lshw -short | grep -i --color display) 2> >(errorHandle);
else
  gpu_command=$(lshw -short | grep -i --color display) 2> >(errorHandle);
fi

# Splitting away spaces & brackets. #
readarray -d "y" -t strarr <<< "$gpu_command" 2> >(errorHandle);
gpu=$(echo ${strarr[1]} | sed 's/ *$//g') 2> >(errorHandle);

if [ "$gpu_only" = true ]; then
  if [ -z "$gpu" ]
  then
    echo "Unable to get GPU label." 2> >(errorHandle);
  else
    echo -e "$gpu" 2> >(errorHandle);
  fi
else
  if [ -z "$gpu" ]; then
    echo "Unable to get GPU label." 2> >(errorHandle);
  else
    echo -e "GPU: $gpu" 2> >(errorHandle);
  fi
fi
