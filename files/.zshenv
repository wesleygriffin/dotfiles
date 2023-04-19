umask 0022

export VISUAL=vim
export EDITOR=vim

PATH=/opt/local/bin:${HOME}/.local/bin:${PATH}
export PATH

export CLICOLOR=1
zstyle ':completion:*:default' list-colors ''

for include in ${HOME}/.dotfiles/etc/profile.d/*.zsh; do
    source $include
done

