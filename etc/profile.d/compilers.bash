# other compilers

function cmake3 {
    export PATH=/opt/cmake/bin:$PATH
}

function __gcc {
    local root=$1
    local vers=$2
    shift 2

    export GCCDIR=${HOME}/local/${root}
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
    export GCCDIR=/opt/gcc
    export GCCLIBDIR=${GCCDIR}/libexec/gcc/x86_64-pc-linux-gnu/6.0.0

    export LD_LIBRARY_PATH=${GCCLIBDIR}:${GCCDIR}/lib64:${LD_LIBRARY_PATH}
    export LIBRARY_PATH=${GCCLIBDIR}:${GCCDIR}/lib64

    export PATH=${GCCDIR}/bin:$PATH
}

function clang38 {
    export LLVMDIR=/opt/llvm

    export LD_LIBRARY_PATH=${LLVMDIR}/lib:${LD_LIBRARY_PATH}
    export LIBRARY_PATH=${LLVMDIR}/lib

    export PATH=${LLVMDIR}/bin:$PATH
}
