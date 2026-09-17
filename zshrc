# Entry point — loads shared config, then OS-specific tweaks.
# Edit modules in zsh/ next to this file rather than this file.

# Repo dir, resolved through the ~/.zshrc symlink, so any clone path works.
DOTFILES="${${(%):-%x}:A:h}"

source "$DOTFILES/zsh/common.zsh"

case "$OSTYPE" in
  darwin*)
    [[ -f "$DOTFILES/zsh/macos.zsh" ]] && source "$DOTFILES/zsh/macos.zsh"
    ;;
  linux*)
    [[ -f "$DOTFILES/zsh/linux.zsh" ]] && source "$DOTFILES/zsh/linux.zsh"
    ;;
esac


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

export PATH="$HOME/.local/bin:$PATH"
