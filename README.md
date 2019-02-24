# My .vimrc

## Installation instructions

### Windows

1. Install Vim and other dependencies using [Scoop][]:
    ```
    scoop install git
    scoop bucket add my-bucket https://github.com/shyun3/my-bucket
    scoop install vim python3 ripgrep cscope ctags universal-ctags
    ```
    - Currently, Vim does not detect Python if installing from the main Scoop
      bucket due to a PATH issue

1. Extract this repo and run `symlinks.bat`. This will create create symlinks
   for `_vimrc`,`_gvimrc`, and `vimfiles` in your home directory. You can
   modify what Vim interprets as your home directory by editing your `HOME`
   environment variable.

1. Install [vim-plug][].

1. Start Vim. Ignore any errors and run `:PlugInstall`. Exit when finished.

1. Install [YouCompleteMe][ycm-windows].

1. Download [Powerline fonts][]. Install them by running `install.ps1`.

1. Happy Vimming!

### macOS

1. Install [MacVim][].

1. Extract this repo and run `symlinks.sh`. This will create create symlinks
   for `_vimrc`,`_gvimrc`, and `vimfiles` in your home directory.

1. Install [vim-plug][].

1. Start Vim. Ignore any errors and run `:PlugInstall`. Exit when finished.

1. Install [YouCompleteMe][ycm-mac].

1. Install [Powerline fonts][].

1. Install remaining utilities using [Homebrew][]:
    ```
    brew install ripgrep ctags
    brew install --HEAD universal-ctags/universal-ctags/universal-ctags
    ```

1. Happy Vimming!

## Usage notes

* F5 opens the current file in Chrome. You can install a markdown preview
  extension and then use the mapping while editing markdown files. Make sure
  the extension has been allowed access to file URLs.

[Scoop]: http://scoop.sh/
[ycm-windows]: https://github.com/Valloric/YouCompleteMe#windows
[Powerline fonts]: https://github.com/powerline/fonts
[MacVim]: http://macvim-dev.github.io/macvim/
[ycm-mac]: https://github.com/Valloric/YouCompleteMe#mac-os-x
[Homebrew]: https://brew.sh/
[vim-plug]: https://github.com/junegunn/vim-plug
