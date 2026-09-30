# niri-configs

My [niri](https://github.com/YaLTeR/niri) config, shared across machines.

## Setup on a new machine

```sh
git clone git@github.com:jnutterdev/niri-configs.git ~/github.com/jnutterdev/niri-configs
~/github.com/jnutterdev/niri-configs/install.sh
```

`install.sh` symlinks `~/.config/niri` to this repo (moving any existing config aside), so edits made anywhere land here and just need a commit.

## Layout

`config.kdl` includes everything in `cfg/`:

| File | Contents |
|---|---|
| `cfg/keybinds.kdl` | Key and mouse bindings |
| `cfg/input.kdl` | Keyboard, touchpad, mouse settings |
| `cfg/display.kdl` | Monitor outputs (per-machine — check `niri msg outputs`) |
| `cfg/layout.kdl`, `cfg/animation.kdl`, `cfg/rules.kdl`, `cfg/misc.kdl` | Appearance and behavior |
| `cfg/autostart.kdl` | Startup apps (noctalia-shell) |
| `bin/toggle-touchpad` | Touchpad on/off (`Mod+Shift+T`) |

## Touchpad toggle

`Mod+Shift+T` runs `bin/toggle-touchpad`, which creates or removes `cfg/touchpad-state.kdl` (an optional include that sets `touchpad { off }`). That file is gitignored, so turning the touchpad off on one machine never gets committed or synced to another.

## Mouse buttons (Logitech MX Anywhere 2S / MX series)

| Button | Action |
|---|---|
| Top side button (`MouseForward`) | Workspace up |
| Bottom side button (`MouseBack`) | Workspace down |
| Button below the wheel (`MouseMiddle`) | Toggle overview |

These override browser back/forward and middle-click paste.
