# colors
BLACK="\[\e[0;30m\]"
BBLACK="\[\e[1;30m\]"
BLACKBG="\[\e[40m\]"
RED="\[\e[0;31m\]"
BRED="\[\e[1;31m\]"
REDBG="\[\e[41m\]"
GREEN="\[\e[0;32m\]"
BGREEN="\[\e[1;32m\]"
GREENBG="\[\e[42m\]"
YELLOW="\[\e[0;33m\]"
BYELLOW="\[\e[1;33m\]"
YELLOWBG="\[\e[43m\]"
BLUE="\[\e[0;34m\]"
BBLUE="\[\e[1;34m\]"
BLUEBG="\[\e[44m\]"
MAGENTA="\[\e[0;35m\]"
BMAGENTA="\[\e[1;35m\]"
MAGENTABG="\[\e[45m\]"
CYAN="\[\e[0;36m\]"
BCYAN="\[\e[1;36m\]"
CYANBG="\[\e[46m\]"
WHITE="\[\e[0;37m\]"
BWHITE="\[\e[1;37m\]"
WHITEBG="\[\e[47m\]"
COLOROFF="\[\e[0m\]"

function __git_prompt_command() {
    if [ ! -z "$(upsearch .nogitprompt)" ]; then return; fi
    if [ ! -z "${NOGITPROMPT}" ]; then return; fi

    local BRANCH=$(git branch 2>/dev/null | \grep "^\*" | cut -f2- -d\ )

    if [ ! -z "$(upsearch .nogitstatusprompt)" ]; then
        PS1+=" ${BLUE}[${BRANCH}]${COLOROFF}"
        return
    fi

    local GIT_STATUS_FLAGS="--porcelain -z"

    if [ ! -z "$(upsearch .nogitstatusunknownprompt)" ]; then
        GIT_STATUS_FLAGS+=" -uno"
    fi

    local GIT_STATUS=$(git status ${GIT_STATUS_FLAGS} 2>&1)

    if ! [[ "${GIT_STATUS}" =~ ^fatal: ]]; then
        local COLORON=${BBLACK}

        for line in ${GIT_STATUS}; do
            if [[ "$line" =~ ^\?\? ]]; then
                COLORON=${MAGENTA};
                break;
            else
                COLORON=${BRED};
                break;
            fi
        done

        PS1+=" ${COLORON}[${BRANCH}]${COLOROFF}"
    fi
}

function __host_prompt_command() {
    if [[ ${SSH_TTY} == $(tty) ]]; then
        PS1+="${BRED}(ssh)${COLOROFF} "
    fi

    PS1+="${BWHITE}"
    PS1+="\h${COLOROFF}:\w"

    #__git_prompt_command
    # short git prompt: just get the branch
    local BRANCH=$(git branch 2>/dev/null | \grep "^\*" | cut -f2- -d\ )
    PS1+=" ${BBLUE}[${BRANCH}]${COLOROFF}"
}

function __prompt_command() {
    EXIT="$?"
    PS1=""

    if [ ${EXIT} -eq 0 ]; then
        PS1+="${GREEN}[\!]${COLOROFF} ";
    else
        PS1+="${RED}[\!]${COLOROFF} ";
    fi

    __host_prompt_command

    PS1+="\$ "
    PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

    case "${TERM}" in
    xterm*|rxvt*)
        PS1="\[\e]0;\h: \w\a\]${PS1}"
        ;;
    screen)
        #PS1="\[\ek\h: \w\]${PS1}"
        ;;
    *)
        ;;
    esac
}

#PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} __prompt_command"
PROMPT_COMMAND="__prompt_command"
export PROMPT_DIRTRIM=4

