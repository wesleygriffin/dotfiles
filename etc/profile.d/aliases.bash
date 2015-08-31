# bash aliases

alias l='\ls -ht --color=auto -ACF'
alias ls='\ls -ht --color=auto -ACF'
alias lsn='\ls -h --color=auto -ACF'
alias ll='\ls -ht --color=auto -ACFls'
alias lln='\ls -h --color=auto -ACFls'

alias gr='grep --color=auto'
alias fgr='fgrep --color=auto'
alias egr='egrep --color=auto'
alias rgr='grep -r'

alias g='git'
alias gh='git help'
alias h='history'
alias d='display'
alias ko='kde-open'
alias go='gnome-open'
alias links='elinks'
alias sa='ssh-add < /dev/null'

#alias matlab='matlab -nosplash -nodesktop -nojvm'
alias runm='matlab -r $*'

alias mkd='mkdir -p'

alias df='df -h'
alias du='du -h'
alias js='j --stat'

alias sb='source ${HOME}/.bashrc'

alias bc='bc -l ${HOME}/userlib.bc'
function qc() { args=("$@"); echo ${args} | bc; }

alias mk='make'
alias mp='make -j`getconf _NPROCESSORS_ONLN`'
alias a2l='addr2line -Cfise'
alias np='getconf _NPROCESSORS_ONLN'
