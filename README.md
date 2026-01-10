On a brand-new Omarchy install, you just do this:

1.    Define the alias:
      alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

2.    Clone your repo:
      git clone --bare git@github.com:YOUR_USERNAME/dotfiles.git $HOME/.cfg

3.    Checkout the files:
      config checkout

Note: If the checkout fails because Omarchy already created default files, just run:
config checkout -f (The -f forces your saved files to overwrite the defaults).

## Fresh Install Restoration Guide

For a complete restoration on a new Arch Linux + Hyprland (Omarchy) system:

1. **Install base system**: Boot into Arch Linux installer and set up base system with pacman.

2. **Install dependencies** (explicit list for your setup):
   ```
   sudo pacman -S hyprland waybar neovim zsh tmux ghostty atuin swaync wlogout git base-devel curl wget imagemagick feh
   ```
   - `hyprland`: Window manager.
   - `waybar`: Status bar.
   - `neovim`: Editor (with LazyVim).
   - `zsh`: Shell (with Oh My Zsh + plugins).
   - `tmux`: Multiplexer.
   - `ghostty`: Terminal emulator.
   - `atuin`: Shell history tool.
   - `swaync`: Notification center.
   - `wlogout`: Logout menu.
   - `git`: Version control.
   - `base-devel curl wget`: Essentials.
   - `imagemagick feh`: For wallpapers/images.

3. **Define the config alias**:
   ```
   alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
   ```

4. **Clone the bare repo**:
   ```
   git clone --bare git@github.com:Sanyam-jhingan/OmarchyDotfiles.git $HOME/.cfg
   ```

5. **Configure Git**:
   ```
   config config --local status.showUntrackedFiles no
   ```

6. **Checkout the dotfiles**:
   ```
   config checkout
   ```
   If conflicts (e.g., existing defaults), force overwrite:
   ```
   config checkout -f
   ```

7. **Install additional dependencies if needed** (run the backup script):
   ```
   ./backup.sh --install-deps
   ```

8. **Reload services**:
   - Hyprland: `hyprctl reload`
   - Zsh: `source ~/.zshrc`
   - Tmux: `tmux source-file ~/.tmux.conf`
   - Restart any affected apps (e.g., waybar, ghostty).

9. **Verify**: Check configs like `hyprctl monitors` or `waybar` in Hyprland.

## Backup Usage

Use `./backup.sh` to backup your dotfiles:

- **Dry-run (preview)**: `./backup.sh` (default; shows what would be backed up, ends with real command).
- **Apply backup**: `./backup.sh --real` (adds, commits with auto-generated message, pushes).
- **Install deps**: `./backup.sh --install-deps` (installs packages via pacman).

The script backs up: ~/.zshrc, ~/.tmux.conf, ~/.config/ghostty/config, ~/.config/atuin/, ~/.config/swaync/, ~/.config/wlogout/, ~/.todoist/, ~/.config/hypr/, ~/.config/waybar/, ~/.config/nvim/, ~/Wallpapers/, ~/Documents/Arch notes/, and their backup variants (e.g., .bak, .bck).
