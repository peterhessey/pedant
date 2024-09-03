# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	zsh-autosuggestions
	git
    direnv
)

source $ZSH/oh-my-zsh.sh
source ~/powerlevel10k/powerlevel10k.zsh-theme

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

# keys

export MATHPIX_API_KEY="f5bafb0be45b079dccc8b2d2de6f84d8c577403b8232093a25458eac182bfd9c"
export MATHPIX_API_ID="f5bafb0be45b079dccc8b2d2de6f84d8c577403b8232093a25458eac182bfd9c"
export OPENAI_API_KEY="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"
export LANGCHAIN_API_KEY="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"
export LANGCHAIN_TRACING_V2=true


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
