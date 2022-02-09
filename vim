#! /bin/bash

#####################################################################################
#Script Name	:   Vim
#Description	:   Run a lightweight docker container and start a custom vim editor
#Args           :   filename (optional)
#Author       	:   Antonio Pantaleo
#Email         	:   antonio_pantaleo@icloud.com
#####################################################################################


VOL=$PWD

if [[ -n $@ ]]
then
    MY_PATH=$(echo "$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")")
    VOL=$(dirname "$MY_PATH")
    docker run --rm -ti -v $VOL:/home antoniopantaleo/vim:latest $(basename $1)
else
    docker run --rm -ti -v $VOL:/home antoniopantaleo/vim:latest
fi