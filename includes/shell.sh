#!/usr/bin/env bash
set -euo pipefail

log "Installing Oh My Bash..."

if [ ! -d "$HOME/.oh-my-bash" ]; then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
fi

log "Setting 'cooperkid' theme for Oh My Bash..."
sed -i 's/^OSH_THEME=.*/OSH_THEME="cooperkid"/' "$HOME/.bashrc"

cp "$SCRIPT_DIR/../config/bashrc" "$HOME/.bashrc"
