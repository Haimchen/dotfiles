# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="lukerandall"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:/Applications/Postgres.app/Contents/Versions/latest/bin

# for tmuxinator
export EDITOR='vim'
export DISABLE_AUTO_TITLE=true

# rbenv installation
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init - zsh)"

alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

alias t="tig status --all"

alias gco="git checkout"

alias gpl="git pull"

alias gps="git push"

alias gfa="git fetch --all"

# initialize rbenv on zsh start
if which rbenv > /dev/null; then eval "$(rbenv init --no-rehash - zsh)"; fi
