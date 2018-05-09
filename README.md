# Configuration for Vim8

I use [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins used in Vim.

## How to install vim8 on ubuntu 16.04?
```bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```

### Uninstall
```bash
sudo apt install ppa-purge && sudo ppa-purge ppa:jonathonf/vim
```

## Install universal-tags for vim-gutentags
Refer [github](https://github.com/universal-ctags/ctags)
### Mac
```bash
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
```

### Linux
```bash
$ ./autogen.sh
$ ./configure --prefix=/where/you/want # defaults to /usr/local
$ make
$ make install # may require extra privileges depending on where to install
```

## You have to compile YouCompleteMe by yourself.
