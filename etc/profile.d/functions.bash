# bash functions

function h2d {
    echo "ibase=16; $@" | bc;
}
function d2h {
    echo "obase=16; $@" | bc;
}
function mi {
    \egrep "(processor|model name)" /proc/cpuinfo
}

# search towards root for a file
function upsearch {
  DIR=${2:-$PWD}
  slashes=${DIR//[^\/]/}
  directory="$DIR"
  for (( n=${#slashes}; n>0; --n )); do
    test -e "$directory/$1" && echo "$directory/$1" && return
    directory="$directory/.."
  done
}

function pollupdate {
    # list of files to watch; end of list specified with "--"
    while [ "$#" -gt 0 -a "$1" != "--" ]; do
        local f["${#f[@]}"]="$1"; shift;
    done
    shift

    # run remainder of command line on any change
    local ts nts
    while nts="$(stat -c %Y "${f[@]}")"; do
        [ "${ts}" != "${nts}" ] && eval "$@"
        ts="${nts}"; sleep 0.5s
    done
}

if [[ ${HOSTNAME} =~ .*nist.gov ]]; then

    function hevroot {
        cd ${HEVROOT}
    }

    function hevdemos {
        cd ${HEVROOT}/demos
    }

    function hevhere {
        PROFILE=profile

        if [ ! -f $PROFILE ]; then
            PROFILE=$(upsearch profile)
            while [ ! -z "$PROFILE" ]; do
                grep -q "set up HEV environment" $PROFILE
                if [ $? == 0 ]; then break; fi
                DN=$(dirname $PROFILE)/..
                PROFILE=$(upsearch profile $DN)
            done
        fi

        if [ -f $PROFILE ]; then
            unset DTK_SHAREDMEM_DIR
            export HEVROOT=$(readlink -f $(dirname $PROFILE))
            source $HEVROOT/profile $1 iris
        else
            echo "No HEV profile found"
        fi
    }

fi

