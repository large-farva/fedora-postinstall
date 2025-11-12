#!/usr/bin/env bash
set -euo pipefail

# Logging functions
log() { echo -e "\e[32m[+] $*\e[0m"; }
err() { echo -e "\e[31m[!] $*\e[0m"; exit 1; }

log "Fedora Postinstall Script Starting..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/includes/homebrew.sh"
source "$SCRIPT_DIR/includes/flatpak.sh"
source "$SCRIPT_DIR/includes/fonts.sh"
source "$SCRIPT_DIR/includes/gnome-extensions.sh"
source "$SCRIPT_DIR/includes/shell.sh"
source "$SCRIPT_DIR/includes/distrobox.sh"
source "$SCRIPT_DIR/includes/git.sh"
source "$SCRIPT_DIR/includes/aliases.sh"
source "$SCRIPT_DIR/includes/steam.sh"

log "Postinstall script completed successfully."
