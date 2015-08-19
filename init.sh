#!/bin/bash

if [[ $EUID -eq 0 ]]; then
    if [[ -z $1 ]]; then
        echo "Running this script as root requires a username to be provided"
        exit 1
    fi
    chown_user=$1
    shift
fi

file_dir=$(readlink -f ${BASH_SOURCE%/*})

cd $HOME
echo "ln -s $file_dir/bashrc .bashrc"

