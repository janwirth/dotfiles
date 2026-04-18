# macOS-specific shell config

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.1.0/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

export FPATH="/usr/local/share/zsh/functions:$FPATH"

# pnpm (macOS location)
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Aliases (macOS-only tools)
alias tile="chunkc tiling::desktop --layout bsp"
alias uglycopy="uglifyjs | pbcopy"
alias j8="export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home; java -version"

# Google Cloud SDK
[[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]] && . "$HOME/google-cloud-sdk/path.zsh.inc"
[[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]] && . "$HOME/google-cloud-sdk/completion.zsh.inc"

# fasd init (macOS setup uses fasd directly)
command -v fasd >/dev/null 2>&1 && eval "$(fasd --init auto)"
