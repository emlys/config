# .bash_profile is called anytime a login shell starts
# mac Terminal is always a login shell
# .bashrc is called when a non-login shell starts
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# set up git autocompletion and prompt, downloading latest version of scripts
curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash --output ~/.git-completion.bash
source ~/.git-completion.bash
curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh --output ~/.git-prompt.sh
source ~/.git-prompt.sh

# custom prompt, light/dark green
PS1="$(__git_ps1 "(%s)") \[\033[1;32m\]\u@\h:\[\033[2;32m\]\w\[\033[0;00m\]\$ "

# aliases
alias g='git'
__git_complete g __git_main  # set up autocomplete for alias

# replace all instances of 1st arg with 2nd arg
# in all tracked files on current branch in current directory
replace() {
    # git branch --show-current: the current branch name
    # ls-tree: list tree contents
    # -r: recursively
    # --name-only: only print out the file name
    git ls-tree -r --name-only $(git branch --show-current) | \
    # xargs grep: check if each file matches the given pattern
    # -I: ignore binary files
    # -l: just print the name of each matching file
    # .: pattern that matches any character
    xargs grep -Il . | \
    # xargs sed: search and replace in each file
    # -i '': don't save backup copies of modified files
    # "s/$1/$2/g": replace each occurrence of the first arg with the second
    xargs sed -i '' "s/$1/$2/g"
}

function extended_pip(){
    if [ "${CONDA_PROMPT_MODIFIER-}" = "(base) " ] && [ "$1" = "install" ]; then
      echo "Not allowed in base environment"
    else
      command pip "$@"
    fi
}

function extended_conda(){
    echo "extended conda"
    if [ "${CONDA_PROMPT_MODIFIER-}" = "(base) " ] && [ "$1" = "install" ]; then
      echo "Not allowed in base environment"
    else
      conda "$@"
    fi
}



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/emily/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/emily/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/emily/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/emily/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias pip=extended_pip
alias conda=extended_conda

# set up homebrew
export PATH="/opt/homebrew/bin:$PATH"

# set up subl
export PATH="/Applications/Sublime Text (4126).app/Contents/SharedSupport/bin:$PATH"


eval "$(rbenv init - bash)"
export PATH="/usr/local/opt/openjdk@8/bin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/emily/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/emily/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/emily/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/emily/Downloads/google-cloud-sdk/completion.bash.inc'; fi

export PATH="/usr/local/opt/node@18/bin:$PATH"
export PATH="/usr/local/opt/node@20/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE='/Users/emily/miniforge3/bin/mamba';
export MAMBA_ROOT_PREFIX='/Users/emily/invest/bash';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
