#!/bin/bash

# Define color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No color

# Test .bashrc
if [ -L "$HOME/.bashrc" ] && [ "$(readlink "$HOME/.bashrc")" = "$HOME/.dotfiles/.bashrc" ]; then
    echo -e "${GREEN}.bashrc is correctly symlinked to .dotfiles/.bashrc${NC}"
else
    echo -e "${RED}.bashrc symlink test failed${NC}"
fi

# Test .bash_profile
if [ -L "$HOME/.bash_profile" ] && [ "$(readlink "$HOME/.bash_profile")" = "$HOME/.dotfiles/.bash_profile" ]; then
    echo -e "${GREEN}.bash_profile is correctly symlinked to .dotfiles/.bash_profile${NC}"
else
    echo -e "${RED}.bash_profile symlink test failed${NC}"
fi

# Test .zshrc
if [ -L "$HOME/.zshrc" ] && [ "$(readlink "$HOME/.zshrc")" = "$HOME/.dotfiles/.zshrc" ]; then
    echo -e "${GREEN}.zshrc is correctly symlinked to .dotfiles/.zshrc${NC}"
else
    echo -e "${RED}.zshrc symlink test failed${NC}"
fi

# Test Oh My Zsh custom directory
if [ -d "$HOME/.oh-my-zsh/custom" ] && [ "$(readlink "$HOME/.oh-my-zsh/custom")" = "$HOME/.dotfiles/custom" ]; then
    echo -e "${GREEN}Oh My Zsh custom directory is correctly symlinked to .dotfiles/custom${NC}"
else
    echo -e "${RED}Oh My Zsh custom directory symlink test failed${NC}"
fi
