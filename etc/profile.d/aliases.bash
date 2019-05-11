# bash aliases

alias l='\ls -ht --color=auto -ACF'
alias ls='\ls -ht --color=auto -ACF'
alias lsn='\ls -h --color=auto -ACF'
alias ll='\ls -ht --color=auto -ACFls'
alias lln='\ls -h --color=auto -ACFls'

alias tmux='tmux -2'
alias tm='tmux -2'
alias tma='tmux -2 attach-session -t'

alias gr='grep --color=auto'
alias fgr='fgrep --color=auto'
alias egr='egrep --color=auto'
alias rgr='grep -r'

alias pg='pgrep -a'
alias pk='pkill'

alias g='git'
alias h='history'
alias d='display'
alias o='xdg-open'

alias df='df -h'
alias du='du -h'

alias sb='source ${HOME}/.bashrc'

alias bc='bc -l ${HOME}/userlib.bc'
function qc() { args=("$@"); echo ${args} | bc; }

alias mk='make'
alias mp='make -j`getconf _NPROCESSORS_ONLN`'
alias a2l='addr2line -Cfise'
alias np='getconf _NPROCESSORS_ONLN'

