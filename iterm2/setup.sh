#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath -m .)/com.googlecode.iterm2.plist"
DESTINATION="$(realpath -m ~/Library/Preferences)/com.googlecode.iterm2.plist"

info "Setting up iTerm2..."

# Copy (not symlink): iTerm2 rewrites this plist in place while running.
cp -f "$SOURCE" "$DESTINATION"

success "Finished setting up iTerm2."
