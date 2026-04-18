# Entry point — loads shared config, then OS-specific tweaks.
# Edit modules in ~/dotfiles/zsh/ rather than this file.

source ~/dotfiles/zsh/common.zsh

case "$OSTYPE" in
  darwin*)
    [[ -f ~/dotfiles/zsh/macos.zsh ]] && source ~/dotfiles/zsh/macos.zsh
    ;;
  linux*)
    [[ -f ~/dotfiles/zsh/linux.zsh ]] && source ~/dotfiles/zsh/linux.zsh
    ;;
esac
