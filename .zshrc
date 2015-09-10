set -o 'vi'
DEFAULT_USER='jan'
alias vim=nvim
plugins=(fasd tmux)
source ~/shellplugins/z.sh
echo 'z sourced'
ZSH_TMUX_AUTOSTART="true"
ZSH_THEME="bira"

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
