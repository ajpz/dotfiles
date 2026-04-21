# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Personal dotfiles for macOS/Linux. Configuration files live at the repo root (and `vim/`) and are manually symlinked into `~` using `ln -snf`. There is no automated installer — the README documents the exact symlink commands.

## Setup

```bash
git submodule update --init --recursive
```

Then symlink each file as documented in README.md (e.g. `ln -snf ~/workspace/dotfiles/bash_profile ~/.bash_profile`).

## Linting

CI runs ShellCheck on `bash_profile`. To run locally:

```bash
shellcheck bash_profile
```

SC1090 and SC1091 are intentionally suppressed (dynamically sourced files).

## Architecture

### Symlinked dotfiles

| File | Destination |
|------|-------------|
| `bash_profile` | `~/.bash_profile` |
| `gitconfig` | `~/.gitconfig` |
| `tmux.conf` | `~/.tmux.conf` |
| `inputrc` | `~/.inputrc` |
| `ackrc` | `~/.ackrc` |
| `gemrc` | `~/.gemrc` |
| `psqlrc` | `~/.psqlrc` |
| `vim/vimrc` | `~/.vimrc` |
| `vim/` | `~/.vim` |

### Machine-local overrides

`~/.bash_profile.local` and `~/.gitconfig.local` are sourced at the end of their respective configs for per-machine customization. These files are gitignored and not version-controlled.

### Vim plugins

24 plugins managed as git submodules under `vim/bundle/`, loaded via vim-pathogen. Adding a new plugin means adding a submodule under `vim/bundle/<plugin-name>`.

### CI

`.github/workflows/dotfiles-ci.yml` — runs ShellCheck on `bash_profile` only (ubuntu-latest).
