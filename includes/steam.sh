#!/usr/bin/env bash
set -euo pipefail

log "Installing Steam..."

if ! command -v steam &>/dev/null; then
  sudo dnf install -y steam
else
  log "Steam is already installed."
fi
