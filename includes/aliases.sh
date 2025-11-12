#!/usr/bin/env bash
set -euo pipefail

log "Creating modular alias files for Oh My Bash..."

ALIAS_DIR="$HOME/.oh-my-bash/aliases"
mkdir -p "$ALIAS_DIR"

# Define files and contents
declare -A ALIAS_MAP

ALIAS_MAP[nav.aliases.sh]='
# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
'

ALIAS_MAP[ls.aliases.sh]='
# Listing
alias l="ls -lah"
alias ll="ls -l"
alias la="ls -A"
alias lt="ls --tree"
'

ALIAS_MAP[git.aliases.sh]='
# Git
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull"
alias gb="git branch"
alias gco="git checkout"
'

ALIAS_MAP[dnf.aliases.sh]='
# DNF Package Management
alias update="sudo dnf update -y"
alias upgrade="sudo dnf upgrade -y"
alias install="sudo dnf install"
alias remove="sudo dnf remove"
alias search="dnf search"
'

ALIAS_MAP[net.aliases.sh]='
# Networking
alias ports="sudo netstat -tulanp"
alias ipinfo="ip -c a"
alias pingg="ping 8.8.8.8"
'

ALIAS_MAP[sys.aliases.sh]='
# System Info
alias meminfo="free -h"
alias cpuinfo="lscpu"
alias diskspace="df -h"
'

ALIAS_MAP[docker.aliases.sh]='
# Docker
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dps="docker ps"
'

ALIAS_MAP[podman.aliases.sh]='
# Podman
alias pcu="podman-compose up -d"
alias pcd="podman-compose down"
alias pps="podman ps"
alias pli="podman images"
alias prun="podman run -it"
alias pexec="podman exec -it"
alias pst="podman stop"
alias prm="podman rm"
alias pimgrm="podman rmi"
alias plogs="podman logs"
'

ALIAS_MAP[misc.aliases.sh]='
# Miscellaneous
alias reload="source ~/.bashrc"
alias myip="curl ifconfig.me"
alias showaliases="alias | grep -E '\''^\s*alias '\'' | sort"
'

# Write each alias file
for file in "${!ALIAS_MAP[@]}"; do
  echo "${ALIAS_MAP[$file]}" > "$ALIAS_DIR/$file"
  chmod +x "$ALIAS_DIR/$file"
  log "Created: $file"
done
