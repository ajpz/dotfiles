```
$ brew install the_silver_searcher bash-completion ctags
$ git clone https://github.com/ajpz/dotfiles
$ ln -sf {`pwd`/dotfiles/,~/.}bash_profile
$ ln -s {`pwd`/dotfiles/,~/.}ackrc
$ ln -s {`pwd`/dotfiles/,~/.}gitconfig
$ ln -s {`pwd`/dotfiles/,~/.}inputrc
$ ln -s {`pwd`/dotfiles/vim/,~/.}vimrc
$ ln -s {`pwd`/dotfiles/,~/.}gemrc
$ ln -s {`pwd`/dotfiles/,~/.}psqlrc
$ ln -s {`pwd`/dotfiles/,~/.}tmux.conf
$ mkdir -p ~/.git_template/hooks
$ ln -s `pwd`/git_hooks/* ~/.git_template/hooks/
```

Add solarized to iTerm from https://github.com/altercation/solarized
Add your git user details to `~/.gitconfig.local`:

```
[user]
  email = <email>
  name = <name>
```
