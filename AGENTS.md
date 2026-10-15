# AGENTS.md

This repository stores personal macOS dotfiles. It has no build, test, lint, or CI step. The `setup.sh` scripts change the live machine: they install Homebrew packages, symlink files into `$HOME`, and write macOS `defaults`. Treat every `setup.sh` as destructive and idempotent.

## Bootstrap order is required

`bootstrap.sh` runs `packages/setup.sh` first, then every other `setup.sh` found by `find`. Do not reorder. `packages/setup.sh` installs the Homebrew packages in `packages/Brewfile`; the other scripts depend on them.

## GNU realpath is required

Every `setup.sh` uses `realpath -m`, a GNU flag. macOS ships a BSD `/bin/realpath` that rejects `-m`. GNU coreutils installs `grealpath`, not `realpath`. On a fresh machine, run `realpath -m .` to verify. If it fails, alias `realpath` to `grealpath` before you run `bootstrap.sh`.

## Symlink layout

`scripts/functions.sh` defines `symlink()`. It removes the destination first, then creates the symlink. The files in this repo are the source of truth.

| Source dir | Destination |
|---|---|
| `home/`, `git/`, `vim/`, `zsh/` | `$HOME` |
| `bin/`, `scripts/` | `$HOME/bin` |
| `mise/` | `$HOME/.config/mise` |
| `iterm2/` | `$HOME/Library/Preferences` |

`iterm2/setup.sh` copies its plist, not symlinks it, because iTerm2 rewrites the file in place. Do not change it to a symlink.

## Setup scripts with side effects

- `zsh/setup.sh` installs zsh, runs `chsh`, and clones oh-my-zsh and powerlevel10k (pinned to `v1.11.0`).
- `mise/setup.sh` runs `mise install`. `mise/config.toml` sets node `lts`, python `3.13`, ruby `3`.
- `macos/setup.sh` writes ~730 lines of `defaults`, then kills affected apps. Some changes need a logout or restart.
- `scripts/setup.sh` is `bash`, not `sh`. It does not source `functions.sh` or use `symlink()`. It symlinks every `*.sh` and `*.py` in `scripts/` (including itself and `functions.sh`) to `$HOME/bin`.

## Runtime manager

Use `mise` for language runtimes (see `mise/config.toml`). Do not assume asdf, fnm, rvm, or nvm. `.zshrc` activates mise.

## Personal values

Replace these when you fork this repo:

- `git/.gitconfig`: `user.email`, `user.name`
- `macos/setup.sh`: computer name `abdelrhman`, timezone `Asia/Dubai`, locale `en_AE@currency=AED`, languages `en` and `ar`
- `home/.mackup.cfg`: backup path `.../dotfiles/backup-20200716`

## Known stale or broken parts

- README lists `git/.gitignore_global`; the actual file is `git/.gitignore`, symlinked to `~/.gitignore`.
- `packages/setup.sh` line `fnm use 10` fails: `fnm` is not installed. mise now manages node.
- `packages/setup.sh` `*.list` loop finds no `.list` files; the loop is dead code.
- `.gitconfig` references `~/.gitattributes` and `~/.config/git/template/`; these are not in this repo.
