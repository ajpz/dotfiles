```
$ install iterm2
$ install brew.sh
$ brew install vim
$ brew install fzf
$ brew install the_silver_searcher bash-completion ctags
$ brew install tmux
$ brew install git
$ ssh-keygen -t ed25519 // Add key to github
$ git clone https://github.com/ajpz/dotfiles
$ git submodule init
$ git submodule update
$ ln -sf {`pwd`/dotfiles/,~/.}bash_profile
$ ln -s {`pwd`/dotfiles/,~/.}ackrc
$ ln -s {`pwd`/dotfiles/,~/.}gitconfig
$ ln -s {`pwd`/dotfiles/,~/.}inputrc
$ ln -s {`pwd`/dotfiles/vim/,~/.}vimrc
$ ln -s {`pwd`/dotfiles/,~/.}gemrc
$ ln -s {`pwd`/dotfiles/,~/.}psqlrc
$ ln -s {`pwd`/dotfiles/,~/.}tmux.conf
```

Add solarized to iTerm from https://github.com/altercation/solarized/blob/master/iterm2-colors-solarized/README.md

Add your git user details to `~/.gitconfig.local`:
```
[user]
  email = <email>
  name = <name>
```
