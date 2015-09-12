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
  slashes=${PWD//[^\/]/}
  directory="$PWD"
  for (( n=${#slashes}; n>0; --n ))
  do
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
