# other compilers

function nodedev {
    if [ -d ~/local/nodedev ]; then export PATH=~/local/nodedev/bin:$PATH
    else echo "nodedev: could not locate nodedev directory"
    fi
}

