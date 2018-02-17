# ~/.bashrc: executed by bash(1) for interactive non-login shells.
umask 0022

export VISUAL=vim
export EDITOR=vim

# look for llvm
if [[ -d /opt/llvm ]]; then export LLVM_DIR=/opt/llvm
elif [[ -d $HOME/local/llvm ]]; then export LLVM_DIR=$HOME/local/llvm
fi

if [[ -d /opt/android-studio ]]; then
    PATH=/opt/android-studio/bin:${PATH};
fi

PATH=${HOME}/bin:${HOME}/.local/bin:/opt/local/bin:/opt/cmake/bin:${PATH}
if [ ! -z $LLVM_DIR ]; then PATH=$LLVM_DIR/bin:${PATH}; fi
if [[ $HOSTNAME =~ *.nist.gov ]]; then PATH=/nist/links/generic/bin:${PATH}; fi
export PATH

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# add aws completion
complete -C aws_completer aws

eval `dircolors`
#LS_COLORS=$LS_COLORS:'di=01;37:'
#export LS_COLORS

if [[ -s ${HOME}/.autojump/etc/profile.d/autojump.bash ]]; then
    source ${HOME}/.autojump/etc/profile.d/autojump.bash
fi

if [[ -s /usr/local/HEV/.bashhev ]]; then
    source /usr/local/HEV/.bashhev
fi

for include in ${HOME}/.dotfiles/etc/profile.d/*.bash; do
    source $include
done

