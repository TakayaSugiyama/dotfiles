# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles repository containing configuration files and scripts for a Unix-like development environment. The setup includes configurations for Vim, Zsh (with Oh My Zsh), Tmux, and various development tools.

## Setup Commands

### Initial Setup
```bash
# Install dotfiles and dependencies
source install.sh
```

This script will:
- Install vim-plug for Vim plugin management
- Install Oh My Zsh if not already present
- Create symbolic links for .vimrc and .zshrc
- Install Vim plugins automatically

### Package Management
```bash
# Install Homebrew packages (macOS)
brew bundle install

# Update Brewfile.lock.json after changes
brew bundle dump --force
```

## Architecture & Key Files

### Core Configuration Files
- `.vimrc` - Vim editor configuration with plugins via vim-plug
- `.zshrc` - Zsh shell configuration using Oh My Zsh with agnoster theme
- `.tmux.conf` - Tmux terminal multiplexer configuration with clipboard integration
- `Brewfile` - Homebrew package dependencies for macOS/Linux

### Development Environment
- **Shell**: Zsh with Oh My Zsh framework
- **Editor**: Vim with various plugins including CoC (Conquer of Completion)
- **Terminal Multiplexer**: Tmux with custom key bindings and clipboard support
- **Package Manager**: Homebrew for system dependencies

### Custom Commands & Scripts
- `commands/ide` - Quick tmux session setup for development (creates 4-pane layout)
- `commands/echo-sd` - Japanese "sudden death" message generator script
- Platform-specific commands in `commands/macOS/`

### Key Features
- Cross-platform clipboard integration (macOS/Linux)
- Vim configured for 2-space indentation with syntax highlighting
- Tmux with vi-mode key bindings and pane navigation
- Development tools: gh, ghq, lazygit, ripgrep, jq, etc.

## File Structure Notes
- Symbolic links are created from dotfiles directory to home directory
- Platform-specific configurations handled in tmux.conf and other files
- Commands directory contains utility scripts for development workflow