# other compilers

function cmake3 {
    if [ -d /opt/cmake ]; then export PATH=/opt/cmake/bin:$PATH
    elif [ -d ~/local/cmake ]; then export PATH=~/local/cmake/bin:$PATH
    elif [ -d ~/local/cmake3 ]; then export PATH=~/local/cmake3/bin:$PATH
    elif [ -d ~/local/cmake3.3 ]; then export PATH=~/local/cmake3.3/bin:$PATH
    else echo "cmake3: could not locate cmake directory"
    fi
}

function __gcc {
    local root=$1
    local vers=$2
    shift 2

    if [ -d /opt/gcc ]; then export GCCDIR=/opt/gcc
    elif [ -d ~/local/gcc ]; then export GCCDIR=~/local/gcc
    elif [ -d ~/local/${root} ]; then export GCCDIR=~/local/${root}
    else echo "__gcc: could not locate gcc directory"
    fi

    export GCCLIBDIR=${GCCDIR}/lib/gcc/x86_64-unknown-linux-gnu
    export LD_LIBRARY_PATH=${GCCLIBDIR}/lib64:${GCCLIBDIR}/${vers}:${GCCDIR}/lib64:${GCCDIR}/lib:${LD_LIBRARY_PATH}
    export LIBRARY_PATH=${GCCLIBDIR}/lib64:${GCCLIBDIR}/${vers}:${GCCDIR}/lib64:${GCCDIR}/lib:
    export PATH=${GCCDIR}/bin:$PATH
}

function gcc48 {
    __gcc gcc4.8 4.8.3
}
function gcc5 {
    __gcc gcc5.2 5.2.0
}

function gcc6 {
    if [ -d /opt/gcc ]; then export GCCDIR=/opt/gcc
    elif [ -d /opt/gcc6 ]; then export GCCDIR=/opt/gcc6
    elif [ -d ~/local/gcc6 ]; then export GCCDIR=~/local/gcc6
    else "gcc6: could not locate gcc directory"
    fi

    export GCCLIBDIR=${GCCDIR}/libexec/gcc/x86_64-pc-linux-gnu/6.0.0
    export LD_LIBRARY_PATH=${GCCLIBDIR}:${GCCDIR}/lib64:${LD_LIBRARY_PATH}
    export LIBRARY_PATH=${GCCLIBDIR}:${GCCDIR}/lib64

    export PATH=${GCCDIR}/bin:$PATH
}

function clang38 {
    if [ -d /opt/llvm ]; then export LLVMDIR=/opt/llvm
    elif [ -d ~/local/llvm ]; then export LLVMDIR=~/local/llvm
    else echo "clang38: could not locate llvm directory"
    fi

    export LLVMDIR=/opt/llvm
    export LD_LIBRARY_PATH=${LLVMDIR}/lib:${LD_LIBRARY_PATH}
    export LIBRARY_PATH=${LLVMDIR}/lib
    export PATH=${LLVMDIR}/bin:$PATH
}

