#!/usr/bin/env bash
set -euo pipefail

log "Setting up Flatpak and Flathub..."

if ! command -v flatpak &>/dev/null; then
  sudo dnf install -y flatpak
fi

# Add Flathub if not already present
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

log "Installing Flatpak apps..."

FLATPAKS=(
  com.raggesilver.BlackBox
  com.vscodium.codium
  com.discordapp.Discord
  org.signal.Signal
  de.haeckerfelix.Fragments
  org.onlyoffice.desktopeditors
  io.github.realmazharhussain.GdmSettings
  ca.desrt.dconf-editor
  md.obsidian.Obsidian
  com.github.tchx84.Flatseal
  io.github.flattool.Warehouse
  com.protonvpn.www
)

for app in "${FLATPAKS[@]}"; do
  flatpak install -y flathub "$app"
done
