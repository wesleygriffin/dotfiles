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
#echo "Installing files into $PWD"

for target in $file_dir/files/.*; do
    if [ $(basename $target) == "." -o $(basename $target) == ".." ]; then continue; fi
    echo "ln -s $target $(basename $target)"
done

for target in $file_dir/files/*; do
    split=$(echo $(basename $target) | cut -f1 -d-)
    if [ $split == "split" ]; then
        split=$(echo $target | cut -f2 -d-)
        dir=$(echo $(basename $split) | cut -f1 -d_)
        file=$(echo $split | cut -f2 -d_)
        echo "ln -s $target .$dir/$file"
    else
        echo "ln -s $target $(basename $target)"
    fi
done

if [ ! -d bin ]; then echo "mkdir bin"; fi
for target in $file_dir/bin/*; do
    echo "ln -s $target bin/$(basename $target)"
done

if [ ! -d .fonts ]; then echo "mkdir .fonts"; fi
for target in $file_dir/fonts/*; do
    echo "ln -s $target fonts/$(basename $target)"
done

#- .bash_profile
#- .bashrc
#- .vimrc
#- .vim/...
