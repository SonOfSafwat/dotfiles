#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath -m .)"
DESTINATION="$(realpath -m ~/.config/mise)"

info "Setting up mise..."

mkdir -p "$DESTINATION"
symlink "$SOURCE/config.toml" "$DESTINATION/config.toml"

if command -v mise >/dev/null 2>&1; then
    substep_info "Installing mise-managed runtimes..."
    mise install
else
    substep_error "mise not found; run packages/setup.sh first."
fi

success "Finished setting up mise."
