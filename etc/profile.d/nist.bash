if [[ ${HOSTNAME} =~ *.nist.gov ]]; then
    nvidia-settings -a [gpu:0]/GPUPowerMizerMode=1

    export LLVM_DIR=${HOME}/local/llvm

    alias sudo='echo NO!'
    alias testing='echo NO!'

    alias dtkdebug="export DTK_SPEW_LEVEL=DEBUG"     # Max spewage
    alias dtkinfo="export DTK_SPEW_LEVEL=INFO"
    alias dtknotice="export DTK_SPEW_LEVEL=NOTICE"
    alias dtkwarn="export DTK_SPEW_LEVEL=WARN"
    alias dtkerror="export DTK_SPEW_LEVEL=ERROR"
    alias dtkfatal="export DTK_SPEW_LEVEL=FATAL"      # Min spewage
    alias dtkquiet="unset DTK_SPEW_LEVEL"

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

