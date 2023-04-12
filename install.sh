#!/bin/bash

# Define colors
GREEN='\033[32m'
RED='\033[31m'
RESET='\033[0m'

# Define variables
DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup"
TEMPLATE_REPO="https://github.com/sanchezfdezjavier/dotfiles"
OH_MY_ZSH_DIR="$HOME/.oh-my-zsh"
OH_MY_ZSH_CUSTOM_DIR="$OH_MY_ZSH_DIR/custom"

# Function to echo green text
print_green() {
  echo -e "${GREEN}$1${RESET}"
}

# Function to echo red text
print_red() {
  echo -e "${RED}$1${RESET}"
}

# Clone template dotfiles repository if not already cloned
if [ ! -d "$DOTFILES_DIR" ]; then
    git clone "$TEMPLATE_REPO" "$DOTFILES_DIR"
    print_green "Dotfiles template cloned successfully."
else
    print_green "Dotfiles template already cloned."
fi

# Create backup directory if not already created
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    print_green "Backup directory created successfully."
else
    print_green "Backup directory already exists."
fi

# Move existing dotfiles to backup directory if not already moved
if [ -f "$HOME/.bashrc" ]; then
    mv "$HOME/.bashrc" "$BACKUP_DIR"
    print_green "Moved existing .bashrc to backup directory."
fi
if [ -f "$HOME/.bash_profile" ]; then
    mv "$HOME/.bash_profile" "$BACKUP_DIR"
    print_green "Moved existing .bash_profile to backup directory."
fi
if [ -f "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$BACKUP_DIR"
    print_green "Moved existing .zshrc to backup directory."
fi
# Add more dotfiles here if needed

# Move existing Oh My Zsh custom directory to backup directory if not already moved
if [ -d "$OH_MY_ZSH_CUSTOM_DIR" ]; then
    mv "$OH_MY_ZSH_CUSTOM_DIR" "$BACKUP_DIR"
    print_green "Moved existing Oh My Zsh custom directory to backup directory."
fi

# Create symbolic links to template dotfiles if not already created
if [ ! -L "$HOME/.bashrc" ]; then
    ln -s "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
    print_green "Created symbolic link for .bashrc."
else
    print_green "Symbolic link for .bashrc already exists."
fi
if [ ! -L "$HOME/.bash_profile" ]; then
    ln -s "$DOTFILES_DIR/.bash_profile" "$HOME/.bash_profile"
    print_green "Created symbolic link for .bash_profile."
else
    print_green "Symbolic link for .bash_profile already exists."
fi
if [ ! -L "$HOME/.zshrc" ]; then
    ln -s "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
    print_green "Created symbolic link for .zshrc."
else
    print_green "Symbolic link for .zshrc already exists."
fi
# Add more dotfiles here if needed

# Install Oh My Zsh if not already installed
if [ ! -d "$OH_MY_ZSH_DIR" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    print_green "Symbolic link for .zshrc already exists."
fi
