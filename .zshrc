# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gitfast compleat docker docker-compose aws lol yarn pip python wd kubectl virtualenv)

# User configuration

export PATH="/home/tstirrat/.local/bin:/snap/bin:/home/tstirrat/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH=$PATH:$HOME/Library/Python/3.9/bin
# Add bropages
export PATH=$PATH:/home/tstirrat/.gem/ruby/2.7.0/bin
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Set up theme stuff
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
eval "$(thefuck --alias)"
alias update="sudo apt update && sudo apt full-upgrade"

alias vim="nvim"

# Get virtualenvwrapper working
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source $HOME/Library/Python/3.9/bin/virtualenvwrapper.sh

alias emacs="emacs -nw"
alias gcleanup='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'
alias manage.py='docker-compose exec runserver ./manage.py'
alias djatest='docker-compose exec runserver pytest'
alias djdr='docker-compose exec runserver pip install -r requirements-dev.txt -r test_requirements.txt'
alias django='docker-compose exec runserver'
alias dsql='docker-compose exec postgres psql -U postgres -d omnidev'
alias djbr='dce django apk --no-cache add python3-dev mariadb-dev build-base gcc git'

# Disable omz alias for this so that we can use tldr
unalias tldr

export PATH=$PATH:$(yarn global bin)
export PATH=$PATH:/home/tstirrat/go/bin
