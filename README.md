# My Dotfiles

Set up using instructions from [here](https://www.atlassian.com/git/tutorials/dotfiles).

## Set up on a new device

1. Backup all configs (e.g. `.zshrc`, everything under `.config`, etc.)
2. set up alias with `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
3. Run `git clone --bare git@github.com:peterhessey/pedant.git $HOME/.cfg`
4. Checkout the repo `config checkout`
5. Hide untracked files with `config config --local status.showUntrackedFiles no`
