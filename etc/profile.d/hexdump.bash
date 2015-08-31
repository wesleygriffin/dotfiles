# customized hexdump output
export HD_ADD='"%08_ax  "'
export HD_FIN='"  |" 16/1 "%_p" "|\n"'

export  HD_8='4/1 "%02x " "  " 4/1 "%02x " "  " 4/1 "%02x " "  " 4/1 "%02x "'
export HD_16='2/2 "%04x " "  " 2/2 "%04x " "  " 2/2 "%04x " "  " 2/2 "%04x "'
export HD_32='1/4 "%08x"  "  " 1/4 "%08x"  "  " 1/4 "%08x"  "  " 1/4 "%08x"'

alias hd8='hexdump -e "$HD_ADD" -e "$HD_8" -e "$HD_FIN" -v'
alias hd16='hexdump -e "$HD_ADD" -e "$HD_16" -e "$HD_FIN" -v'
alias hd32='hexdump -e "$HD_ADD" -e "$HD_32" -e "$HD_FIN" -v'
alias hdpnm='hexdump -e "$HD_ADD" -e "$HD_8" -e "$HD_FIN" -v -s 11'
