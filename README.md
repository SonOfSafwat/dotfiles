# Abdelrhman's Dotfiles

## Thanks

**This repo is a collection of the excellent work of those people:**

- [Rosco Kalis](https://github.com/rkalis) [dotfiles](https://github.com/rkalis/dotfiles)
- [Mathias Bynens](https://github.com/mathiasbynens) [dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Zach Holman](https://github.com/holman) [dotfiles](https://github.com/holman/dotfiles)
- [Anish Athalye](https://github.com/anishathalye) [dotfiles](https://github.com/anishathalye/dotfiles)

## Usage

Warning: If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
```

1. Clone this repository

2. Run the `bootstrap.sh` script
   1. Alternatively, only run the `setup.sh` scripts in specific subfolders if you don't need everything
3. (Optional) Point the Alfred preference sync to a backed up folder
4. Login to applications, enter license keys, set preferences

## Customization

If you would like to use these dotfiles for yourself, I'd recommend changing at least the following:

### Git

- The .gitconfig file includes my [user] config, replace these with your own user name and email

### OSX

- At the top of the setup.sh file, my computer name is set, replace this with your own computer name

### Packages

This folder is a collection of the programs and utilities I use frequently. These lists can easily be amended to your liking.

## Contents

### Root (/)

- bootstrap.sh - Calls all setup.sh scripts

### User Bin (bin/)

- setup.sh - Symlinks the other contents of the folder to `~/bin/`
- imgcat - A utility to display images inline in iTerm 2
- sethidden - A shell script which takes command line arguments to show or hide
  hidden files
- togglehidden - A shell script that toggles between showing and hiding hidden
  files

### Git (git/)

- setup.sh - Symlinks all git files to `~/`
- .gitignore_global - Contains global gitignores, such as OS-specific files and
  several compiled files
- .gitconfig - Sets several global Git variables

### macOS Preferences (macos/)

- setup.sh - Executes a long list of commands pertaining to macOS Preferences. Heavily Inspired by [Mathias](https://mths.be/macos)

### Packages (packages/)

- setup.sh - Installs the contents of the .list files and the Brewfile

### Helper Scripts (scripts/)

- functions.sh - Contains helper functions for symlinking files and printing
  progress messages

### Visual Studio Code (vscode/)

- setup.sh - Symlinks the settings.json file to `~/Library/Application Support/Code/User`
- settings.json - Contains user settings for Visual Studio Code
