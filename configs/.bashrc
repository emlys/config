# .bashrc is run in non-login shells

# default
# PS1="\u@\h:\w\$ "

curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh --output ~/.git-prompt.sh
source ~/.git-prompt.sh

# custom prompt, light/dark green
PS1="\$(__git_ps1 '(%s)') \[\033[1;32m\]\u@\h:\[\033[2;32m\]\w\[\033[0;00m\]\$ "


[ -f "/Users/emily/.ghcup/env" ] && source "/Users/emily/.ghcup/env" # ghcup-env

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
