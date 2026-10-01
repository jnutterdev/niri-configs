#!/usr/bin/env bash
# Link this repo into place as ~/.config/niri and its noctalia/ dir as ~/.config/noctalia.
# Any existing config is moved aside to <target>.bak-<timestamp>.
set -euo pipefail

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_home="${XDG_CONFIG_HOME:-$HOME/.config}"

link() {
    local source="$1"
    local target="$2"

    if [ -L "$target" ] && [ "$(readlink -f "$target")" = "$source" ]; then
        echo "Already linked: $target -> $source"
        return
    fi

    if [ -e "$target" ] || [ -L "$target" ]; then
        local backup="$target.bak-$(date +%Y%m%d-%H%M%S)"
        mv "$target" "$backup"
        echo "Moved existing config to $backup"
    fi

    mkdir -p "$(dirname "$target")"
    ln -s "$source" "$target"
    echo "Linked $target -> $source"
}

link "$repo" "$config_home/niri"
link "$repo/noctalia" "$config_home/noctalia"

command -v niri >/dev/null && niri validate
