#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath -m .)"
DESTINATION="$(realpath -m ~)"

info "Setting up zsh & Oh My Zsh..."


 # Test to see if zsh is installed.
  if [ -z "$(command -v zsh)" ]; then
    # If zsh isn't installed, get the platform of the current machine and
    brew install zsh
  fi
  # Set the default shell to zsh if it isn't currently set to zsh
  if [[ ! "$SHELL" == "$(command -v zsh)" ]]; then
    chsh -s "$(command -v zsh)"
  fi
  # Clone Oh My Zsh if it isn't already present
  if [[ ! -d $HOME/.oh-my-zsh/ ]]; then
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"
  fi
  # Clone Powerlevel10k if it isn't already present.
  if [[ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
    git clone --depth=1 \
      --branch v1.11.0 \
      https://github.com/romkatv/powerlevel10k.git \
      "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
  fi

info "Configuraing zsh..."

find * -name ".*" | while read fn; do
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

success "Finished setting up & configuring Zsh"
