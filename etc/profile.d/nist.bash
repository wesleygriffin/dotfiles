if [[ ${HOSTNAME} =~ *.nist.gov ]]; then
    alias sudo='echo NO!'
    alias testing='echo NO!'

    alias dtkdebug="export DTK_SPEW_LEVEL=DEBUG"     # Max spewage
    alias dtkinfo="export DTK_SPEW_LEVEL=INFO"
    alias dtknotice="export DTK_SPEW_LEVEL=NOTICE"
    alias dtkwarn="export DTK_SPEW_LEVEL=WARN"
    alias dtkerror="export DTK_SPEW_LEVEL=ERROR"
    alias dtkfatal="export DTK_SPEW_LEVEL=FATAL"      # Min spewage
    alias dtkquiet="unset DTK_SPEW_LEVEL"
fi

