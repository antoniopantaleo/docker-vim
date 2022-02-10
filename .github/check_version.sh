#! bin/bash

###################################################################
#Script Name	:   check_version
#Description	:   This script checks if VERSION has been updated since last tag
#Args           :   None
#Author       	:   Antonio Pantaleo
#Email         	:   antonio_pantaleo@icloud.com
###################################################################

set -e pipefail

LAST_TAG=$(git tag -l | tail -1)
VERSION=$(cat VERSION)

for i in 1 2 3
do
    LAST_VER=$(echo $LAST_TAG | cut -d\. -f$i)
    VER=$(echo $VERSION | cut -d\. -f$i)
    if [[ $VER -gt $LAST_VER ]]; then
        exit 0
    fi
    if [[ $LAST_VER -gt $VER ]]; then
        echo "Script ended with exit code 1. Did you update the VERSION?"
        exit 1
    fi
    if [[ -n $VER && -z $LAST_VER ]]; then
        exit 0
    fi
    if [[ -z $VER && -n $LAST_VER ]]; then
        echo "Script ended with exit code 1. Did you update the VERSION?"
        exit 1
    fi
done

echo "Script ended with exit code 1. Did you update the VERSION?"
exit 1