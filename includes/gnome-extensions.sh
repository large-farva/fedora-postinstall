#!/usr/bin/env bash
set -euo pipefail

log "Installing GNOME Shell extensions via Flatpak..."

EXTENSIONS=(
  'dash-to-dock@micxgx.gmail.com'
  'app-hider@lynith.dev'
  'extensions-list@tu.berry'
  'Vitals@CoreCoding.com'
  'caffeine@patapon.info'
  'blur-my-shell@aunetx'
  'just-perfection-desktop@just-perfection'
)

if ! flatpak list | grep -q gnome-extensions; then
  flatpak install -y flathub com.mattjakeman.ExtensionManager
fi

for uuid in "${EXTENSIONS[@]}"; do
  if ! gnome-extensions list | grep -q "$uuid"; then
    gnome-extensions install --force --system "$uuid" || log "Install failed for $uuid (may need manual install)"
    gnome-extensions enable "$uuid"
  else
    log "Extension $uuid already installed."
  fi
done
