# other compilers

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
