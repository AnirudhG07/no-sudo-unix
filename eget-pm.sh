#!/bin/bash

# Ensure ~/.local/bin exists
mkdir -p ~/.local/bin

# Base packages to install with standard eget
BASE_PACKAGES=(
    "zyedidia/micro --tag nightly"
    "jgm/pandoc"
    "junegunn/fzf"
    "neovim/neovim"
    "BurntSushi/ripgrep"
    "charmbracelet/glow"
    "sharkdp/bat"
    "tmux/tmux"
)

# Special packages with custom flags
SPECIAL_PACKAGES=(
    ["oyejorge/gojq"]="--pre-release"
    ["zyedidia/eget"]="-f eget.1"
    ["ogham/exa"]="--asset ^musl"
    ["sharkdp/fd"]="--system darwin/amd64"
    ["zachjs/sv2v"]=""
)

# Install base packages
for pkg in "${BASE_PACKAGES[@]}"; do
    echo "Installing $pkg..."
    eget $pkg --to ~/.local/bin
done

# Install special packages
for pkg in "${!SPECIAL_PACKAGES[@]}"; do
    flags="${SPECIAL_PACKAGES[$pkg]}"
    echo "Installing $pkg..."
    eget $pkg $flags --to ~/.local/bin
done

# Handle more complex ones separately
eget https://go.dev/dl/go1.17.5.linux-amd64.tar.gz --file go --to ~/go1.17.5
echo "Installing go..."
# And more such if any

echo "All installations complete!"

