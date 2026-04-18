# Shared shell config (macOS + Linux)

ZSH_DISABLE_COMPFIX=true
export PATH=$HOME/.npm/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export LC_ALL=en_US.UTF-8

# oh-my-zsh
export ZSH=~/.oh-my-zsh
ZSH_THEME="refined"

plugins=(git)
(( $+commands[fasd] )) && plugins+=(fasd)

source $ZSH/oh-my-zsh.sh

# Preferred editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='kak'
fi

# ZNT (zsh-navigation-tools) — loaded if installed
if [[ -d "$HOME/.config/znt/zsh-navigation-tools" ]]; then
  fpath=( "$fpath[@]" "$HOME/.config/znt/zsh-navigation-tools" )
fi
if command -v n-history >/dev/null 2>&1 \
  || [[ -d "$HOME/.config/znt/zsh-navigation-tools" ]] \
  || [[ -d /opt/homebrew/share/zsh-navigation-tools ]] \
  || [[ -d /usr/local/share/zsh-navigation-tools ]]; then
  autoload n-aliases n-cd n-env n-functions n-history n-kill n-list n-list-draw n-list-input n-options n-panelize n-help
  autoload znt-usetty-wrapper znt-history-widget znt-cd-widget znt-kill-widget
  alias naliases=n-aliases ncd=n-cd nenv=n-env nfunctions=n-functions nhistory=n-history
  alias nkill=n-kill noptions=n-options npanelize=n-panelize nhelp=n-help
  zle -N znt-history-widget
  bindkey '^R' znt-history-widget
  zstyle ':completion::complete:n-kill::bits' matcher 'r:|=** l:|=*'
  alias h='n-history'
fi
setopt AUTO_PUSHD HIST_IGNORE_DUPS PUSHD_IGNORE_DUPS

# vim keybindings + history hygiene
bindkey -v
export HISTCONTROL=ignoreboth:erasedups

# Paths
export APPSPATH=$HOME/apps
export GOPATH=$HOME/goprojects
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$APPSPATH/bin
export PATH="$HOME/dotfiles/bin:$PATH"
export N_PREFIX="$HOME/n"
[[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

# Aliases
alias ga="git add"
alias amend="git commit --amend --no-edit"
alias rgl='rg -l'
alias tomp3='yt-dlp --audio-quality=320K -x --audio-format mp3'
alias fix='$EDITOR `git diff --name-only | uniq`'
alias ggl='googler --colors bjdxxy'
alias compress='7z a -tzip $@'
alias decompress='7z x $@'
alias ns='npm start'
alias notes="kak ~/notes"
alias int="sh ~/.xinitrc"
alias gitrefine="git rebase -i HEAD~10"
alias first-commit-in-year='git log --reverse | head -n3 | tail -n1 | cut -f8 -d" "'
alias gource-one-minute='gource --seconds-per-day $((1.0/365 * 60 /8))'
alias work="pomo && pomo -s"
alias tm='task-master'
alias taskmaster='task-master'
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

# corepack proxies
alias yarn="corepack yarn"
alias yarnpkg="corepack yarnpkg"
alias pnpm="corepack pnpm"
alias pnpx="corepack pnpx"
alias npm="corepack npm"
alias npx="corepack npx"

# fasd-based helpers (no-op if fasd missing — ok in practice)
function k () kak `fasd -f $@`
function rid () less `fasd -f $@`
function rgk () kak `rg -l $1`

function transfer () {
  git diff HEAD^ -- $1 > ~/patch_file
  patch -p1 $2 ~/patch_file
}
function project () { echo `pwd | grep -Po "(?<=jan/)([a-z-]*)"`}
function ka () {
  kak -d -s `project`
  kak -c `project` $0
}
function currentBranch () {
  git branch | grep \* | cut -d ' ' -f2
}
function gcol { git checkout @{-1} }

# Local scripts
source ~/dotfiles/rgki.sh
source ~/dotfiles/rebase.zsh

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun (works on both platforms via $HOME)
export BUN_INSTALL="$HOME/.bun"
[[ -d "$BUN_INSTALL/bin" ]] && export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# asdf (optional, loaded if present)
[ -f "$HOME/.asdf/asdf.sh" ] && . "$HOME/.asdf/asdf.sh"
