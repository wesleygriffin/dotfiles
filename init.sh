#!/bin/bash

file_dir=$(readlink -f ${BASH_SOURCE%/*})

if [[ $EUID -eq 0 ]]; then
    if [[ -z $1 ]]; then
        echo "$0: running as root requires a username to be provided"
        exit 1
    fi
    chown_user=$1
    shift
fi

if [[ -z $1 ]]; then
    cd $HOME
elif [[ ! -d $1 ]]; then
    echo "$0: $1 is not a directory; exiting"
    exit 1
else
    cd $1
fi

for target in $file_dir/files/.*; do
    link_name=$(basename $target)
    if [[ $link_name == "." || $link_name == ".." ]]; then continue; fi

    ln -sf $target $link_name

    if [[ ! -z $chown_user ]]; then chown $chown_user $target; fi
done

for target in $file_dir/files/*; do
    link_name=$(basename $target)
    ln -sf $target $link_name

    if [[ ! -z $chown_user ]]; then chown $chown_user $target; fi
done

mkdir -p .vim/tmp/{backup,swap,undo}

