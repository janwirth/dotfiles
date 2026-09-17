# Linux / VPS-specific shell config

# zoxide (fast cd; no-op if not installed)
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"

# persistent ssh-agent via systemd user unit
# Socket path varies: Ubuntu 24.04+'s stock ssh-agent.socket unit (from
# openssh-client) listens on openssh_agent; older/custom units use
# ssh-agent.socket. Try both rather than assuming one.
if [[ -z "$SSH_AUTH_SOCK" && -n "$XDG_RUNTIME_DIR" ]]; then
  for _sock in "$XDG_RUNTIME_DIR/openssh_agent" "$XDG_RUNTIME_DIR/ssh-agent.socket"; do
    if [[ -S "$_sock" ]]; then
      export SSH_AUTH_SOCK="$_sock"
      break
    fi
  done
  unset _sock
fi

# auto-attach tmux on interactive SSH
if [[ -o interactive && -z "$TMUX" && -n "$SSH_CONNECTION" && -t 1 ]] \
  && command -v tmux >/dev/null 2>&1; then
  exec tmux new-session -A -s main
fi
