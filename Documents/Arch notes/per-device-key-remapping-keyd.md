# Per-Device Key Remapping with keyd

## Problem
Broken `t` key on laptop keyboard. Need to remap `4` key to `t` on laptop keyboard only, without affecting external keyboard.

## Solution: keyd
Keyd is a system-wide key remapping daemon that works with Wayland (Hyprland) and supports per-device configuration.

## Installation
```bash
sudo pacman -S keyd
```

## Steps

### 1. Identify Laptop Keyboard Device ID
```bash
sudo keyd monitor
```
Press a key on laptop keyboard. Note the device ID (format: `xxxx:xxxx:xxxxxxxx`).

Example output:
```
device added: 0001:0001:09b4e68d Laptop Keyboard (/dev/input/eventX)
```

### 2. Create Device-Specific Config
```bash
sudo tee /etc/keyd/laptop.conf << 'EOF'
[ids]
0001:0001:09b4e68d

[main]
4 = t
EOF
```

### 3. Enable and Start keyd
```bash
sudo systemctl enable --now keyd
sudo keyd reload
```

## Configuration Format

**Device Matching** - Only affects specific devices:
```ini
[ids]
<device-id-from-monitor>
```

**Key Remapping** - Map source key to target key:
```ini
[main]
<source-key> = <target-key>
```

### Common Key Names
- `4` - Number 4 key
- `t` - Letter t key
- `capslock` - Caps Lock key
- `esc` - Escape key
- `ctrl`, `alt`, `shift` - Modifier keys

Find all key names: `keyd list-keys`

## Panic Sequence
If keyd renders system unusable, press: `backspace + escape + enter` simultaneously

## Notes
- External keyboard unaffected because config only targets laptop keyboard device ID
- Works system-wide including Hyprland/Wayland, TTY, and X11
- Configuration persists across reboots with systemd service enabled

## Useful Commands
```bash
# Reload configuration
sudo keyd reload

# Monitor key events and devices
sudo keyd monitor

# Check service status
systemctl status keyd

# View logs
sudo journalctl -eu keyd
```

## References
- [keyd GitHub](https://github.com/rvaiya/keyd)
- Arch Wiki: `man keyd`