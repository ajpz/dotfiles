```
$ brew install ag macvim bash-completion ctags
$ mkdir -p ~/.vim/autoload ~/.vim/bundle && \
$ curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
$ git clone https://github.com/ajpz/dotfiles
$ ln -sf {`pwd`/dotfiles/,~/.}bash_profile
$ ln -s {`pwd`/dotfiles/,~/.}ackrc
$ ln -s {`pwd`/dotfiles/,~/.}gitconfig
$ ln -s {`pwd`/dotfiles/,~/.}inputrc
$ ln -s {`pwd`/dotfiles/,~/.}vimrc
$ ln -s {`pwd`/dotfiles/,~/.}gemrc
$ ln -s {`pwd`/dotfiles/,~/.}psqlrc
$ mkdir -p ~/.git_template/hooks
$ ln -s `pwd`/git_hooks/* ~/.git_template/hooks/
$ vim -c "PluginInstall" -c "qa"
```

Install the `Menlo for Powerline` font from [here](https://github.com/abertsch/Menlo-for-Powerline/blob/master/Menlo%20for%20Powerline.ttf) (just click raw, open the downloaded file, and then click "Install Font").

Add your git user details to `~/.gitconfig.local`:

```
[user]
  email = <email>
  name = <name>
```
