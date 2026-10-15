#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath -m .)"
DESTINATION="$(realpath -m ~)"

info "Configuring home dotfiles..."

find . -maxdepth 1 -type f -name ".*" ! -name ".DS_Store" | while read fn; do
    fn=$(basename "$fn")
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

success "Finished configuring home dotfiles."
