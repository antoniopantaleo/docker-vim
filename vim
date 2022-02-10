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
    VOL="$(cd "$(dirname "$1")" && pwd -P)"
    docker run --rm -ti -v $VOL:/home ghcr.io/antoniopantaleo/vim:latest $(basename $1)
else
    docker run --rm -ti -v $VOL:/home ghcr.io/antoniopantaleo/vim:latest
fi