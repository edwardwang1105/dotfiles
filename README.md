Edward's dotfiles
========

## How to use

* setup `gvim` and `git`
* copy vim setting file
```bash
$ cd ~/ # if windows use this > cd %HOMEPATH%
$ git clone https://github.com/edwardwang1105/dotfiles.git
$ sh dotfiles/dotfilesLink.sh # if windows use this (with admistrator privileges) > dotfiles/mklink.bat
```
* install plugin
```bash
$ cd ~/ # if windows use this > cd %HOMEPATH%
$ git clone https://github.com/gmarik/Vundle.vim.git .vim/bundle/Vundle.vim
$ # start gvim and run 'PluginInstall'
```
