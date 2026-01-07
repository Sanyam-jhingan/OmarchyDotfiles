# 🐧 Tmux Master Guide

#Tmux is a terminal multiplexer that allows for persistent sessions and split-pane management. 

## ⚙️ The Configuration
- **Config Path:** `~/.config/tmux/tmux.conf` or `~/.tmux.conf`
- **The "Refresh" Command:** 
  Whenever you change the config, run this inside tmux:
  `Prefix` which should be `ctrl + a` then `:` then type `source-file ~/.tmux.conf`
  *(Or use the terminal: `tmux source-file ~/.tmux.conf`)*

---

## ⌨️ My Custom Keybinds (No-Prefix Rice)
*Note: These use the `Alt` (Meta) key for speed.*

### Navigation
- **Move Panes:** `Alt + h/j/k/l` or `Alt + Arrows`
- **Switch Windows:** `Alt + 1-9`
- **Toggle Zoom (Full Screen):** `Alt + f`

### Window & Pane Management
- **Split Vertical:** `Alt + |`
- **Split Horizontal:** `Alt + -`
- **New Window (Tab):** `Alt + w`
- **Close Pane:** `Alt + q`
- **Close Window:** `Alt + Shift + q`

### Session Management
- **Rename Window:** `Alt + r`
- **Rename Session:** `Alt + Shift + r`
- **Detach Session:** `Alt + d`
- **Session Switcher (Visual):** `Alt + s`

---

## 🛠 Terminal Commands (Outside Tmux )
- `tmux ls` : List all active sessions.
- `tmux a` : Attach to the last session.
- `tmux a -t <name>` : Attach to a specific session.
- `tmux new -s <name>` : Start a new named session.

---

## 🚀 Workflow Summary
1. Start session with `tmux new -s project`.
2. Use `Alt + w` for different tasks (e.g., Code, Server, Git).
3. Use `Alt + d` to leave the terminal; everything stays running.
4. Use `tmux a` to return instantly.