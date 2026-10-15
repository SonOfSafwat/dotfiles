

eval "$(/opt/homebrew/bin/brew shellenv)"

case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) export PATH="$HOME/.local/bin:$PATH" ;; esac
