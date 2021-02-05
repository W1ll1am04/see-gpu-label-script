#!/bin/bash

# shellcheck source=/dev/nullfi

# check if a '$1' is installed, if not install it. #
function dependency_test() {  
  if [ $# -eq 1 ]; then
    if [ "$(dpkg-query -W -f='${Status}' "$1" 2>/dev/null | grep -c "ok installed")" -eq 0 ];
    then
      echo "Missing dependency: $1"
      exit
    fi
  else
    echo "dependency_test() does not take 0 arguments."
  fi
}

# Echo errors to the console. #
errorHandle() {
    while read -r line; do
      echo -e "$line"
    done
}
