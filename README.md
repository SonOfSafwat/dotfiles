# Abdelrhman's Dotfiles

## Thanks

**This repo is a collection of the excellent work of those people:**

- [Rosco Kalis](https://github.com/rkalis) [dotfiles](https://github.com/rkalis/dotfiles)
- [Mathias Bynens](https://github.com/mathiasbynens) [dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Zach Holman](https://github.com/holman) [dotfiles](https://github.com/holman/dotfiles)
- [Anish Athalye](https://github.com/anishathalye) [dotfiles](https://github.com/anishathalye/dotfiles)

## Usage

Warning: If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don't want or need. Don't blindly use my settings unless you know what that entails. Use at your own risk!

### Prerequisites

- Install Homebrew and git.
- GNU `realpath` is required. Every `setup.sh` uses `realpath -m`, a GNU flag that macOS `/bin/realpath` rejects. GNU coreutils installs `grealpath`, not `realpath`. Run `realpath -m .` to verify; if it fails, alias `realpath` to `grealpath` before you run `bootstrap.sh`.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
```

1. Clone this repository

2. Run the `bootstrap.sh` script. It runs `packages/setup.sh` first (which installs the `Brewfile` packages), then every other `setup.sh`.
   1. Alternatively, only run the `setup.sh` scripts in specific subfolders if you don't need everything
3. (Optional) Point the Alfred preference sync to a backed up folder
4. Login to applications, enter license keys, set preferences

## Customization

If you would like to use these dotfiles for yourself, I'd recommend changing at least the following:

### Git

- `git/.gitconfig` - replace `user.name` and `user.email` with your own

### macOS

- `macos/setup.sh` - replace the computer name (`abdelrhman`), timezone (`Asia/Dubai`), locale (`en_AE@currency=AED`), and languages (`en`, `ar`)

### Packages

- `packages/Brewfile` - amend the Homebrew formulae, casks, and Mac App Store apps to your liking

### Runtimes

- `mise/config.toml` - adjust the runtime versions (node `lts`, python `3.13`, ruby `3`)

### Backup

- `home/.mackup.cfg` - replace the backup path `.../dotfiles/backup-20200716`

## Contents

### Root (/)

- `bootstrap.sh` - Runs `packages/setup.sh` first, then every other `setup.sh`
- `AGENTS.md` - Repository conventions (bootstrap order, symlink layout, runtime manager)

### Home dotfiles (home/)

- `setup.sh` - Symlinks the dotfiles to `$HOME`
- `.tmux.conf`, `.prettierrc`, `.profile`, `.zprofile`, `.zlogin`, `.npmrc`, `.mackup.cfg` - Home config files

### User Bin (bin/)

- `setup.sh` - Symlinks the scripts to `~/bin/`
- Git helpers and other utilities (`git-*`, `gitio`, `search`, `todo`, and more)

### Git (git/)

- `setup.sh` - Symlinks the git files to `$HOME`
- `.gitconfig` - Global Git configuration
- `.gitignore` - Global gitignores, symlinked to `~/.gitignore`

### macOS Preferences (macos/)

- `setup.sh` - Writes a long list of macOS `defaults`. Heavily inspired by [Mathias](https://mths.be/macos)

### Packages (packages/)

- `Brewfile` - Homebrew formulae, casks, and Mac App Store apps
- `setup.sh` - Runs `brew bundle` to install the `Brewfile`

### Helper Scripts (scripts/)

- `setup.sh` - Symlinks the scripts to `~/bin/`
- `functions.sh` - Helper functions for symlinking and printing progress
- Other shell helpers (`colors.sh`, `ansi-color-dump.sh`, and more)

### Vim (vim/)

- `setup.sh` - Symlinks the vim files to `$HOME`
- `.vimrc` - Vim configuration

### Zsh (zsh/)

- `setup.sh` - Installs zsh, oh-my-zsh, and powerlevel10k; symlinks the dotfiles
- `.zshrc`, `.aliases.zsh`, `.p10k.zsh` - Shell configuration

### mise (mise/)

- `setup.sh` - Symlinks `config.toml` to `~/.config/mise` and runs `mise install`
- `config.toml` - Language runtimes: node `lts`, python `3.13`, ruby `3`

### iTerm2 (iterm2/)

- `setup.sh` - Copies the plist to `~/Library/Preferences`
- `com.googlecode.iterm2.plist` - iTerm2 settings and profiles
