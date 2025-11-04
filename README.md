# Dotfiles

A curated collection of configuration files that define the day-to-day development environment for macOS and Linux machines. These dotfiles capture preferred defaults for the shell, terminal multiplexing, version control, database clients, and editors.

## Repository responsibilities

These files are intended to be symlinked into your home directory so that each tool picks up consistent settings. The key areas covered include:

- **Shell experience**
  - `bash_profile`: primary login shell configuration with PATH setup, aliases, and shell options.
  - `inputrc`: readline configuration that harmonizes keyboard shortcuts across shells and CLI programs.
- **Terminal tooling**
  - `tmux.conf`: layout, colors, and key bindings for tmux sessions.
  - `com.googlecode.iterm2.plist`: iTerm2 profile export capturing fonts, colors, and shortcuts.
- **Search and navigation utilities**
  - `ackrc`: defaults for the `ack` search tool, including ignored directories and filetype mappings.
  - `fzf` and `the_silver_searcher` are expected companions and are configured through shell integration in the dotfiles.
- **Editor setup**
  - `vim/vimrc`: central Vim configuration with plugins managed via the `vim/bundle` submodule tree.
- **Version control**
  - `gitconfig`: global Git preferences plus optional inclusion of `~/.gitconfig.local` for personal identity and secrets.
- **Language- and service-specific tweaks**
  - `gemrc`: RubyGems defaults, particularly for installing gems without documentation.
  - `psqlrc`: PostgreSQL console prompt and formatting preferences.

## Prerequisites

1. Install [Homebrew](https://brew.sh) if you are on macOS.
2. Install the core CLI tools used by these dotfiles:

   ```bash
   brew install vim fzf the_silver_searcher bash-completion ctags tmux git tree
   ```

   > Substitute `apt`, `dnf`, or another package manager for non-macOS systems.
3. Generate an SSH key and add it to GitHub (or your preferred Git hosting provider):

   ```bash
   ssh-keygen -t ed25519
   ```

4. (Optional) Import the Solarized color scheme into iTerm2 by following the steps in the [official Solarized repository](https://github.com/altercation/solarized/blob/master/iterm2-colors-solarized/README.md).

## Installation

Clone the repository and initialize any bundled submodules:

```bash
git clone https://github.com/ajpz/dotfiles.git ~/dotfiles
cd ~/dotfiles
git submodule update --init --recursive
```

Symlink the configuration files into your home directory so they take effect:

```bash
DOTFILES_DIR="$HOME/dotfiles"

ln -snf "$DOTFILES_DIR/bash_profile" "$HOME/.bash_profile"
ln -snf "$DOTFILES_DIR/ackrc" "$HOME/.ackrc"
ln -snf "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"
ln -snf "$DOTFILES_DIR/inputrc" "$HOME/.inputrc"
ln -snf "$DOTFILES_DIR/gemrc" "$HOME/.gemrc"
ln -snf "$DOTFILES_DIR/psqlrc" "$HOME/.psqlrc"
ln -snf "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"
ln -snf "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"
ln -snf "$DOTFILES_DIR/vim" "$HOME/.vim"
```

Feel free to add or remove symlinks depending on which tools you use. Re-running the commands above is safe and will update existing links in place.

## Personal customization

- Add your Git identity details in `~/.gitconfig.local`. This file is purposely excluded from version control so you can store your name, email, and any credentials locally:

  ```ini
  [user]
    email = you@example.com
    name = Your Name
  ```
- Extend or override other dotfiles by sourcing additional files from your home directory (for example, `~/.bash_profile.local`) if you have machine-specific preferences.

## Updating

Whenever you pull the latest changes, make sure Vim plugins and submodules are kept up to date:

```bash
cd ~/dotfiles
git pull --rebase
git submodule update --init --recursive
```

Because the dotfiles are linked into your home directory, updates take effect immediately. Restart your shell, tmux session, or editor to pick up any changes that require a reload.
