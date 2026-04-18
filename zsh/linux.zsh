# Linux / VPS-specific shell config

# zoxide (fast cd; no-op if not installed)
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"

# persistent ssh-agent via systemd user unit
if [[ -n "$XDG_RUNTIME_DIR" ]]; then
  _sock="$XDG_RUNTIME_DIR/ssh-agent.socket"
  [[ -S "$_sock" ]] && export SSH_AUTH_SOCK="$_sock"
  unset _sock
fi

# auto-attach tmux on interactive SSH
if [[ -o interactive && -z "$TMUX" && -n "$SSH_CONNECTION" && -t 1 ]] \
  && command -v tmux >/dev/null 2>&1; then
  exec tmux new-session -A -s main
fi
