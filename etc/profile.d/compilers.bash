# other compilers

function nodedev {
    if [ -d ~/local/nodedev ]; then export PATH=~/local/nodedev/bin:$PATH
    else echo "nodedev: could not locate nodedev directory"
    fi
}

function cmake3 {
    if [ -d /opt/cmake ]; then export PATH=/opt/cmake/bin:$PATH
    elif [ -d ~/local/cmake ]; then export PATH=~/local/cmake/bin:$PATH
    elif [ -d ~/local/cmake3 ]; then export PATH=~/local/cmake3/bin:$PATH
    elif [ -d ~/local/cmake3.3 ]; then export PATH=~/local/cmake3.3/bin:$PATH
    else echo "cmake3: could not locate cmake directory"
    fi
}

function clang38 {
    if [ -d /opt/llvm ]; then export LLVMDIR=/opt/llvm
    elif [ -d ~/local/llvm ]; then export LLVMDIR=~/local/llvm
    else echo "clang38: could not locate llvm directory"
    fi

    export LD_LIBRARY_PATH=${LLVMDIR}/lib:${LD_LIBRARY_PATH}
    export LIBRARY_PATH=${LLVMDIR}/lib
    export PATH=${LLVMDIR}/bin:$PATH
}

