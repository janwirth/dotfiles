#!/bin/bash
# Model name plus static badges for the caveman/ponytail/i-have-adhd modes
# merged into ~/.claude/CLAUDE.md as always-on defaults. The badges reflect
# the configured default, not a live "stop caveman" mid-chat state.
# Claude Code passes session JSON on stdin; model is .model.display_name.
model="$(sed -n 's/.*"display_name" *: *"\([^"]*\)".*/\1/p' | head -1)"
printf '\033[1m%s\033[0m \033[38;5;172m[CAVEMAN]\033[0m \033[38;5;108m[PONYTAIL]\033[0m \033[38;5;39m[ADHD]\033[0m' "${model:-?}"
