# If you come from bash you might have to change your $PATH.


ZSH_DISABLE_COMPFIX=true
export PATH=$HOME/.npm/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export FPATH=$FPATH:/usr/local/share/zsh-navigation-tools
export LC_ALL=en_US.UTF-8
# stty intr \^k

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="refined"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
plugins=(
  git
  fasd
  # fuck
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='hx'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



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

### MY STUFF
# alias kak=hx
alias ga="git add"
alias amend="git commit --amend --no-edit"

# Open by file name
function k () kak `fasd -f $@`

# Open by file name
function rid () less `fasd -f $@`

alias rgl='rg -l'
alias pip='pip3'

alias tomp3='youtube-dl --audio-quality=320K -x --audio-format mp3'

alias h='n-history'     # interactive file selection

# vim keybindings
bindkey -v

# keep dupes out of history
export HISTCONTROL=ignoreboth:erasedups

# recent branches
# alias grb='git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(refname:short)'

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# open all files with matches in kakoune
function rgk () kak `rg -l $1`

# open all files with conflicts in kakoune
alias fix='$EDITOR `git diff --name-only | uniq`'

alias ggl='googler --colors bjdxxy'

alias compress='7z a -tzip $@'
alias decompress='7z x $@'

alias ns='npm start'
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

export APPSPATH=$HOME/apps
export GOPATH=$HOME/goprojects

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$APPSPATH/bin

# usage: transfer some_file another_file
# will transfer changes from some_file to another_file
function transfer () {
  git diff HEAD^ -- $1 > ~/patch_file # from file
  patch -p1 $2 ~/patch_file # to file
}

function project () { echo `pwd | grep -Po "(?<=jan/)([a-z-]*)"`}
function ka () {
  kak -d -s `project`
  kak -c `project` $0
}

# eval $(thefuck --alias)

function currentBranch () {
  git branch | grep \* | cut -d ' ' -f2
}

function gcol {
  git checkout @{-1}
}

alias notes="kak ~/notes"

alias uglycopy="uglifyjs | pbcopy"
alias tile="chunkc tiling::desktop --layout bsp"


# source ~/dotfiles/pomodoro/pomodoro.sh
source ~/dotfiles/rgki.sh
source ~/dotfiles/rebase.zsh

alias work="pomo && pomo -s"

alias gitrefine="git rebase -i HEAD~10"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/jan/tuna-backend/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/jan/tuna-backend/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/jan/tuna-backend/node_modules/tabtab/.completions/sls.zsh ]] && . /home/jan/tuna-backend/node_modules/tabtab/.completions/sls.zsh

alias int="sh ~/.xinitrc"


git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/janwirth/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/janwirth/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/janwirth/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/janwirth/google-cloud-sdk/completion.zsh.inc'; fi

# /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh

export PATH="/opt/homebrew/bin:$PATH"

 export FPATH="/usr/local/share/zsh/functions:$FPATH"

export PATH="/Users/janwirthprivate/compiler/dist-newstyle/build/aarch64-osx/ghc-8.10.7/elm-0.19.1/x/elm/opt/build/elm:$PATH"
