
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
plugins=(git gitfast compleat docker docker-compose aws lol yarn pip python wd kubectl lein rh-tools)

# User configuration

export PATH="/home/tstirrat/.local/bin:/snap/bin:/home/tstirrat/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# Add bropages

# Make homebrew work
eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

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
eval $(thefuck --alias)

alias emacs="emacs -nw"
alias gcleanup='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'

# Disable omz alias for this so that we can use tldr
unalias tldr

## Mac-specific bits
alias vim="nvim"
alias vi="nvim"
eval "$(direnv hook zsh)"
# Add JAVA_HOME so that clojure is happy
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home

## Reify-specific aliases
alias login='eval $(op signin teamreifyhealth)'
# spql is sponsor, siql is site
alias spql='psql -h localhost -p 15432 -U postgres -d db'
alias siql='psql -h localhost -p 15433 -U postgres -d db'

# Add doom bits to path
export PATH=$PATH:~/.config/emacs/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.bin
export PATH=$PATH:$(yarn global bin)
export PATH=$PATH:/home/tstirrat/go/bin

# Get nvm set up
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Virtualenvwrapper stuff
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/Users/tstirrat/.local/pipx/venvs/virtualenvwrapper/bin/python3
source /Users/tstirrat/.local/bin/virtualenvwrapper_lazy.sh

source /Users/tstirrat/.docker/init-zsh.sh || true # Added by Docker Desktop
alias tele='telepresence'
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
