#!/bin/bash

# shellcheck source=/dev/null
source "$(dirname "$0")"/misc.sh

FOLDER="config"
FILE="gpush.cfg"
CONFIG="$FOLDER/$FILE"

# Handle writing to config #
writeHandle() {
    echo -n "" > $CONFIG
    while read -r line; do
        echo -e "$line" >> "$CONFIG"
    done
}

# Handle reading config #
function readconfig() {
    while read -r var value; do
        export "$var"="$value" 2> >(errorHandle)
    done < "$CONFIG"
}

# Reset config. #
function resetConfig() {
    echo -e '#GPUSH Configuration file.
        no_su=false
        gpu_only=false
        skip_dep_test=false' > >(writeHandle) 2> >(errorHandle)
}

# Initialize config if it's missing. #
if [ -f "$CONFIG" ]; then
    # replace $dirname with local script var for things. #
    source "$(dirname "$0")"/$CONFIG 2> >(errorHandle)
else
    if [ ! -d $FOLDER ]; then
        mkdir $FOLDER 2> >(errorHandle)
    fi
    resetConfig
fi