# .bashrc is run in non-login shells

# default
# PS1="\u@\h:\w\$ "

# light/dark green
PS1="\[\033[1;32m\]\u@\h:\[\033[2;32m\]\w\[\033[0;00m\]\$ "

[ -f "/Users/emily/.ghcup/env" ] && source "/Users/emily/.ghcup/env" # ghcup-env
