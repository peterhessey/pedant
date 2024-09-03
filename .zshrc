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
    direnv
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/peter/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/peter/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/peter/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/peter/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# pyenv

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"


# aliases

## general

alias newlog="python ~/scripts/new_md_log.py"
alias st="speedtest"
alias cds="cd ~/scratch"
alias c="clear"
alias ls="exa"

## makefile

alias ma="make check && make test"
alias sma="git stage . && make check && make test"
alias mc="make check"
alias smc="git stage . && make check"
alias mt="make test"
alias smt="git stage . && make test"

## extra git aliases

alias gac="git add -A && git commit --amend --no-edit"
alias gamp="git add -A && git commit --amend --no-edit && git push --force-with-lease"
alias gs="git status"
alias gcm="git commit -m"
alias gmc="gitmoji --commit"
alias gmac="git add -A && gitmoji --commit"
alias gbpurge="git branch --merged | grep -v '\*' | grep -Ev '(\*|master|develop|staging)' | xargs -n 1 git branch -d"

### open a new branch (gnb = git new branch)
function gnb() {
    gb "$1"
    gco "$1"
    gpsup
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Created by `pipx` on 2024-06-27 07:52:19
export PATH="$PATH:/home/peter/.local/bin"

## poetry

alias pos="poetry shell"
alias pol="poetry lock"
alias pou="poetry update"
alias poi="poetry install"
alias pob="poetry build"
alias pocc="poetry cache clear . --all"
alias config='/usr/bin/git --git-dir=/home/peter/.cfg/ --work-tree=/home/peter'
