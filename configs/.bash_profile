# .bash_profile is called anytime a login shell starts
# mac Terminal is always a login shell
# .bashrc is called when a non-login shell starts
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# set up git autocompletion
if [ -f ~/.git-completion.bash ]; then
. ~/.git-completion.bash
fi

# aliases
alias g='git'
__git_complete g _git  # set up autocomplete for alias

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/emily/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/emily/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/emily/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/emily/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-env
