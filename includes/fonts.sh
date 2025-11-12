#!/usr/bin/env bash
set -euo pipefail

log "Installing SF Pro fonts..."

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

if [ ! -d "$FONT_DIR/SF-Pro-Fonts" ]; then
  git clone --depth=1 https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts.git "$FONT_DIR/SF-Pro-Fonts"
  fc-cache -f "$FONT_DIR"
else
  log "SF Pro Fonts already installed."
fi

log "Setting SF Pro Display as system interface font..."

gsettings set org.gnome.desktop.interface font-name 'SF Pro Display 11'
gsettings set org.gnome.desktop.interface document-font-name 'SF Pro Display 11'
