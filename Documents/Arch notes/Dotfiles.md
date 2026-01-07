# 📂 Dotfiles Master Guide (Bare Git Repo)

This is how I manage my system configurations without using symlinks or moving files out of their natural habitat.

## 🛠 The "Config" Command
Instead of `git`, I use the `config` alias to talk to my dotfiles repo.
- **Alias Definition:** `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`

### Essential Workflow
- `config status` — See which config files have changed.
- `config add <file_path>` — Track a new file (e.g., `config add ~/.zshrc`).
- `config commit -m "update waybar"` — Save changes locally.
- `config push` — Send changes to GitHub.

---

## 🔄 Refreshing / Applying Changes
If you edit a file, the system doesn't always know immediately. Use these "source" commands:

### 1. Zsh (Shell)
`source ~/.zshrc`
*Do this whenever you add a new alias or change your terminal theme.*

### 2. Tmux
`tmux source-file ~/.tmux.conf`
*Required to apply changes to your tmux status bar or keybinds without restarting.*

### 3. Hyprland
`hyprctl reload` (or your shortcut `Super + Shift + C`)
*Instantly applies changes to your window rules or animations.*

---

## 🆘 Recovery: New Machine Setup
If I ever need to reinstall Omarchy:
1. `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
2. `git clone --bare git@github.com:YOUR_USERNAME/dotfiles.git $HOME/.cfg`
3. `config config --local status.showUntrackedFiles no`
4. `config checkout`
   - *If it fails due to existing files:* `config checkout -f`