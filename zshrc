# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

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
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$HOME/n/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='kak'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
set -o 'vi'
DEFAULT_USER='jan'
plugins=(fasd)

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection

alias h='n-history'     # interactive file selection

eval "$(fasd --init auto)"
eval "$(thefuck --alias)"
PATH=$PATH:$HOME/kakoune/src/
function k () kak `fasd -f $@`


# exports for Node and Python
export NODE_PATH=/usr/local/lib/node_modules
export PYTHONPATH=./:$PYTHONPATH
export GOPATH=/usr/local/lib/go_projects
PATH=$PATH:$GOPATH


### ZNT's installer added snippet ###
fpath=( "$fpath[@]" "$HOME/.config/znt/zsh-navigation-tools" )
autoload n-aliases n-cd n-env n-functions n-history n-kill n-list n-list-draw n-list-input n-options n-panelize n-help
autoload znt-usetty-wrapper znt-history-widget znt-cd-widget znt-kill-widget
alias naliases=n-aliases ncd=n-cd nenv=n-env nfunctions=n-functions nhistory=n-history
alias nkill=n-kill noptions=n-options npanelize=n-panelize nhelp=n-help
zle -N znt-history-widget
bindkey '^R' znt-history-widget
setopt AUTO_PUSHD HIST_IGNORE_DUPS PUSHD_IGNORE_DUPS
zstyle ':completion::complete:n-kill::bits' matcher 'r:|=** l:|=*'
### END ###
# 
# export https_proxy=http://proxy.intra.dmc.de:3128
# export http_proxy=http://proxy.intra.dmc.de:3128
# export HTTPS_PROXY=$https_proxy
# export HTTP_PROXY=$http_proxy
# export no_proxy=localhost,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16
# export NO_PROXY=no_proxy
# # 
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# yarn bins
export PATH="$HOME/.yarn/bin:$PATH"

alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias ga="git add"
alias amend="git commit --amend --no-edit"




# AEM stuff
export _DEVAEM_AUTHOR_PORT=`xmllint --xpath "//*[local-name()='configuration']/*[local-name()='port']/text()" ~/one-web/owf-aem-development-server/author/pom.xml`
export _DEVAEM_PUBLISH_PORT=`xmllint --xpath "//*[local-name()='configuration']/*[local-name()='port']/text()" ~/one-web/owf-aem-development-server/publish/pom.xml`

alias aemDeployPackageOnAuthor="mvn clean install -Pserver-package-deploy -Dcq.server=http://localhost:${_DEVAEM_AUTHOR_PORT}"
alias aemDeployPackageOnPublish="mvn clean install -Pserver-package-deploy -Dcq.server=http://localhost:${_DEVAEM_PUBLISH_PORT}"
alias aemRedeploy="mvn clean cq-deploy -f ~/one-web/owf-aem-development-server/pom.xml"
alias aemDeploy="mvn cq-deploy -f ~/one-web/owf-aem-development-server/pom.xml"
alias aemStart="mvn cq-start -f ~/one-web/owf-aem-development-server/pom.xml"
alias aemStop="mvn cq-stop -f ~/one-web/owf-aem-development-server/pom.xml"


rebase () {
  echo "ex) $ rebase.sh [BRANCH NAME]"
  echo "git checkout master && git pull --rebase origin master && git checkout [BRANCH NAME] && git pull --rebase origin [BRANCH NAME] && git merge master && git push origin [BRANCH NAME]"
  echo ""

  echo "  $ git checkout master"
  git checkout master

  echo "  $ git pull --rebase origin master"
  git pull --rebase origin master

  echo "  $ git checkout "$1
  git checkout $1

  echo "  $ git pull --rebase origin "$1
  git pull --rebase origin $1

  echo "  $ git merge master"
  git merge master

  echo "  $ git push origin "$1
  git push origin $1
}

# Open by file name
function k () kak `fasd -f $@`

# Open by file name
# function read () less `fasd -f $@`

# Open nth res with kak
function rgk () kak `rg -l $1 | sed "${2}q;d"`

alias rgl='rg -l'

alias tomp3='youtube-dl --audio-quality=320K -x --audio-format mp3'
