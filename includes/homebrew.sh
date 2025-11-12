#!/usr/bin/env bash
set -euo pipefail

log "Installing and configuring Homebrew..."

# Install Homebrew if missing
if ! command -v brew &>/dev/null; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "$HOME/.bashrc"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  log "Homebrew installed."
else
  log "Homebrew already installed."
fi

# Load brew environment for current session
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Run diagnostics
log "Running brew doctor..."
brew doctor || log "brew doctor reported warnings (non-critical)."

# Update & upgrade
log "Updating Homebrew..."
brew update
brew upgrade

# Formulae to install
log "Installing Homebrew formulae..."

BREW_PACKAGES=(
  # CLI enhancements
  bat
  fd
  ripgrep
  fzf

  # System info
  tldr
  htop
  btop
  duf

  # Dev tools
  git
  gh
  cosign
  wget
  curl

  # Networking
  speedtest-cli

  # Other tools
  tree
  fastfetch
)

for pkg in "${BREW_PACKAGES[@]}"; do
  if ! brew list --formula | grep -q "^$pkg\$"; then
    log "Installing: $pkg"
    brew install "$pkg"
  else
    log "Already installed: $pkg"
  fi
done

# Casks to install
log "Installing Homebrew casks..."

BREW_CASKS=(
  # Fonts
  font-meslo-lg-nerd-font
)

for cask in "${BREW_CASKS[@]}"; do
  if ! brew list --cask | grep -q "^$cask\$"; then
    log "Installing cask: $cask"
    brew install --cask "$cask"
  else
    log "Already installed cask: $cask"
  fi
done

# Cleanup unused deps and cache
log "Running brew autoremove and cleanup..."
brew autoremove
brew cleanup

log "Homebrew installation and configuration complete."
