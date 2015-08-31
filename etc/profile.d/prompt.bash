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

    if [[ ${HOSTNAME} =~ dradis.* ]]; then
        PS1+=" [${BRANCH}]"
        return
    elif [ ! -z "$(upsearch .nogitstatusprompt)" ]; then
        PS1+=" [${BRANCH}]"
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
        PS1+="${RED}(ssh)${COLOROFF} "
    fi

    if [[ ${HOSTNAME} =~ dradis.* ]]; then
        PS1+="${REDBG}${BWHITE}"
    else
        PS1+="${BLUE}"
    fi

    PS1+="\h${COLOROFF}:\w"

    if ! [ -z ${HEVROOT} ]; then
        PS1+=" ${YELLOW}[$(basename ${HEVROOT})"
        if [ -d ${HEVROOT}/.git ]; then
            PS1+=" git"
        fi
        if ! [ -z ${HEV_PROFILE_DEBUG} ]; then
            PS1+=" DEBUG"
        fi
        PS1+="]${COLOROFF}"
    fi

    if ! [ -z ${GCCDIR} ]; then
        PS1+=" ${YELLOW}[$(basename ${GCCDIR})]${COLOROFF}"
    fi
    if ! [ -z ${INTEL_LICENSE_FILE} ]; then
        PS1+=" ${YELLOW}[icc]${COLOROFF}"
    fi

    __git_prompt_command
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

    case "${TERM}" in
    xterm*|rxvt*)
        PS1="\[\e]0;\h: \w\a\]${PS1}"
        ;;
    *)
        ;;
    esac
}

PROMPT_COMMAND=__prompt_command
export PROMPT_DIRTRIM=4
