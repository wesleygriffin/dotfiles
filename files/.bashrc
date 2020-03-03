# ~/.bashrc: executed by bash(1) for interactive non-login shells.
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

umask 0022

export VISUAL=vim
export EDITOR=vim

PATH=/opt/local/bin:${HOME}/.local/bin:${PATH}
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

eval `dircolors`

for include in ${HOME}/.dotfiles/etc/profile.d/*.bash; do
    source $include
done

