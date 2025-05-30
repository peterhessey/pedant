# uncomment to trace zsh init if it's slow (uncomment stuff at end of file also!)

# zmodload zsh/datetime
# setopt PROMPT_SUBST
# PS4='+$EPOCHREALTIME %N:%i> '
#
# logfile=$(mktemp zsh_profile.XXXXXXXX)
# echo "Logging to $logfile"
# exec 3>&2 2>$logfile
#
# setopt XTRACE

# this stops bugs in ssh terminal
# export TERM=screen-256color


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# theme
ZSH_THEME="powerlevel10k/powerlevel10k"


# plugins
plugins=(
	zsh-autosuggestions
	git
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pyenv

export PATH="$HOME/.pyenv/bin:$PATH"
# commented out for speed issues
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"

# replace pyenv init as it's slow in zshrc
pyenv() {
    eval "$(command pyenv init -)"

    pyenv "$@"
}

# nvm

export NVM_DIR="$HOME/.nvm"


# Get the OS type
OS=$(uname)

if [ "$OS" = "Linux" ]; then
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
elif [ "$OS" = "Darwin" ]; then
  # was making startup slow, seems okay now?
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
else
    echo "Unknown operating system: $OS"
fi



export NVM_DIR="$HOME/.nvm"
# aliases

## general

newlog() {
    python3 ~/scripts/new_md_log.py "$@"
}
alias st="speedtest"
alias cds="cd ~/scratch"
alias c="clear"
alias ls="exa"

## kitty
alias s="kitten ssh"
alias icat="kitten icat"

## makefile

alias ma="make check && make test"
alias sma="git stage . && make check && make test"
alias mc="make check"
alias smc="git stage . && make check"
alias mt="make test"
alias smt="git stage . && make test"

## clang

### adds warning flags to all g++ commands - useful for learning
alias g++='g++ -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -pedantic-errors'  
alias g++17='g++ -std=c++17'

## extra git aliases

alias gac="git add -A && git commit --amend --no-edit"
alias gamp="git add -A && git commit --amend --no-edit && git push --force-with-lease"
alias gs="git status"
alias gcm="git commit -m"
alias gmc="gitmoji --commit"
alias gmac="git add -A && gitmoji --commit"
alias gbpurge="git branch --merged | grep -v '\*' | grep -Ev '(\*|master|develop|staging)' | xargs -n 1 git branch -d"
alias gfl="gf && gl"

### open a new branch (gnb = git new branch)
function gnb() {
    gb "$1"
    gco "$1"
    gpsup
}

### git + pre-commit

alias gpc="git add . && pre-commit run -a"
alias pca="pre-commit run -a"

export NVM_DIR="$HOME/.nvm"
# uncomment below to enable nvm - uncommented as it makes things slow (on MacOS)
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## venv

alias va="source .venv/bin/activate"

## poetry

poetry_with() {
  poetry install --with "$1"
}

alias pos="poetry shell"
alias pol="poetry lock"
alias pou="poetry update"
alias poi="poetry install"
alias pob="poetry build"
alias pocc="poetry cache clear . --all"
alias poiw="poetry_with"

## uv

alias ur="uv run"

## docker

alias dc="docker compose"
alias dcr="dc down -v && dc build && dc up -d"

## config stuff
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' 

## nvim

alias n="nvim ."
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

## pants

alias pa="pants fmt :: && pants check :: && pants test ::"

## key-bindings

### fixing word skipping in remote terminal when using MacOS keyboard

bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word

## PATH fixing

### linux
export PATH="$PATH:/home/$USER/.local/bin"

### macOS
export PATH="$PATH:/Users/$USER/.local/bin"

# also uncomment this 

# unsetopt XTRACE
# exec 2>&3 3>&-

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/peter.hessey/Downloads/google-cloud-sdk 3/path.zsh.inc' ]; then . '/Users/peter.hessey/Downloads/google-cloud-sdk 3/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/peter.hessey/Downloads/google-cloud-sdk 3/completion.zsh.inc' ]; then . '/Users/peter.hessey/Downloads/google-cloud-sdk 3/completion.zsh.inc'; fi
