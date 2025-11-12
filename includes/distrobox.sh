#!/usr/bin/env bash
set -euo pipefail

log "Installing Distrobox..."

if ! command -v distrobox &>/dev/null; then
  sudo dnf install -y distrobox podman
fi

DISTROS=("arch" "ubuntu")

for distro in "${DISTROS[@]}"; do
  if ! distrobox list | grep -q "$distro"; then
    log "Creating Distrobox container: $distro"
    distrobox create --name "$distro" --image "$distro" --yes
  else
    log "Distrobox $distro already exists."
  fi
done
