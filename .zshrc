# Path to your oh-my-zsh installation.
export ZSH=/home/tstirrat/.oh-my-zsh

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
plugins=(git gitfast compleat docker docker-compose aws lol yarn pip python wd)

# User configuration

export PATH="/home/tstirrat/.local/bin:/opt/bro/bin:/home/tstirrat/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# Add bropages
export PATH=$PATH:/home/tstirrat/.gem/ruby/2.5.0/bin
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

# Get virtualenvwrapper working
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /home/tstirrat/.local/bin/virtualenvwrapper.sh

alias emacs="emacs -nw"
alias gcleanup='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'
alias manage.py='docker-compose exec django ./manage.py'
alias dyarn='docker-compose exec react yarn'
alias latest-master='git checkout master && git pull origin master'
alias all-master='cd ~/getmyboat/development; latest-master; cd getmyboat-django; latest-master; cd ../react-universal; latest-master; cd ../getmyboat; latest-master;'
alias djatest='docker-compose exec django env DJANGO_SETTINGS_MODULE=getmyboat.settings.testing pytest --reuse-db'
alias django='docker-compose exec django'
alias react='docker-compose exec react'
alias ci='docker-compose exec codeigniter'
alias dmysql='docker-compose exec mysql mysql -proot'
alias dcil='docker-compose exec codeigniter tail -f /proc/1/fd/2'

export PATH=$PATH:$(yarn global bin)
