#!/bin/zsh

# Omarchy Dotfiles Backup Script
# Default: Dry-run mode (preview changes, output real command at end)
# Usage: ./backup.sh [--real] [--install-deps]

set -e  # Exit on error
setopt nullglob  # Allow globs with no matches

# Define config alias if not available
if ! command -v config &> /dev/null; then
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
fi

# Check if bare repo exists
if [[ ! -d ~/.cfg ]]; then
    echo "Error: Bare repo ~/.cfg not found. Clone it first: git clone --bare <repo> ~/.cfg"
    exit 1
fi

# Parse arguments
DRY_RUN=true
INSTALL_DEPS=false
if [[ "$1" == "--real" ]]; then
    DRY_RUN=false
elif [[ "$1" == "--install-deps" ]]; then
    INSTALL_DEPS=true
fi

# Function to install dependencies
install_deps() {
    echo "Installing dependencies..."
    sudo pacman -S --needed hyprland waybar neovim zsh tmux ghostty atuin swaync wlogout git base-devel curl wget imagemagick feh
    echo "Dependencies installed."
}

# Main paths to backup
MAIN_PATHS=(
    "~/.zshrc"
    "~/.tmux.conf"
    "~/.config/ghostty/config"
    "~/.config/atuin/"
    "~/.config/swaync/"
    "~/.config/wlogout/"
    "~/.todoist/"
    "~/.config/hypr/"
    "~/.config/waybar/"
    "~/.config/nvim/"
    "~/Wallpapers/"
    "~/Documents/Arch notes/"
)

# Expand paths and collect all (main + variants)
ALL_PATHS=()
for path in "${MAIN_PATHS[@]}"; do
    expanded=$(eval echo "$path")
    ALL_PATHS+=("$expanded")
    # Detect variants: anything matching <path>.*
    if [[ -d "$expanded" || -f "$expanded" ]]; then
        base=${expanded:t}  # Zsh basename
        dir=${expanded:h}   # Zsh dirname
        for variant in "$dir/$base".*; do
            if [[ -e "$variant" && "$variant" != "$expanded" ]]; then
                ALL_PATHS+=("$variant")
            fi
        done
    fi
done

# If install deps
if $INSTALL_DEPS; then
    install_deps
    exit 0
fi

# Check for changes
CHANGES=()
for path in "${ALL_PATHS[@]}"; do
    if [[ -e "$path" ]]; then
        if ! config ls-files --error-unmatch "$path" &>/dev/null; then
            # New/untracked
            CHANGES+=("$path")
        elif [[ -n $(config status --porcelain "$path") ]]; then
            # Modified
            CHANGES+=("$path")
        fi
    fi
done

# Dry-run or real
if $DRY_RUN; then
    echo "Dry-run mode: Previewing changes..."
    if [[ ${#CHANGES[@]} -eq 0 ]]; then
        echo "No changes detected."
    else
        echo "Would add and commit the following:"
        for change in "${CHANGES[@]}"; do
            echo "  - $change"
        done
        DATE=${(%):-%D{%Y-%m-%d}}
        MSG="Backup dotfiles: $DATE"
        echo "Would commit with message: '$MSG'"
        echo "Would require manual push: 'config push origin master'"
    fi
    echo ""
    echo "To apply these changes, run: ./backup.sh --real"
else
    echo "Real mode: Applying changes..."
    if [[ ${#CHANGES[@]} -gt 0 ]]; then
        for change in "${CHANGES[@]}"; do
            config add "$change"
            echo "Added: $change"
        done
        DATE=${(%):-%D{%Y-%m-%d}}
        MSG="Backup dotfiles: $DATE"
        config commit -m "$MSG"
        echo "Committed with message: '$MSG'"
        echo "Run 'config push origin master' to push changes to remote."
    else
        echo "No changes to commit."
    fi
fi