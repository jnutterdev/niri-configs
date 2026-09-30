#!/usr/bin/env bash
# Link this repo into place as ~/.config/niri.
# Any existing config is moved aside to ~/.config/niri.bak-<timestamp>.
set -euo pipefail

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
target="${XDG_CONFIG_HOME:-$HOME/.config}/niri"

if [ -L "$target" ] && [ "$(readlink -f "$target")" = "$repo" ]; then
    echo "Already linked: $target -> $repo"
    exit 0
fi

if [ -e "$target" ] || [ -L "$target" ]; then
    backup="$target.bak-$(date +%Y%m%d-%H%M%S)"
    mv "$target" "$backup"
    echo "Moved existing config to $backup"
fi

mkdir -p "$(dirname "$target")"
ln -s "$repo" "$target"
echo "Linked $target -> $repo"

command -v niri >/dev/null && niri validate
