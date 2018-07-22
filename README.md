# My .vimrc

## Installation instructions

### Windows

1. Install Vim using [Scoop][]: `scoop install vim`

1. Install Python:
    ```
    scoop bucket add versions
    scoop install python36
    ```
    - Currently, Vim does not detect Python if installing from the main Scoop
      bucket due to a PATH issue

1. Run `symlinks.bat`. This will create create symlinks for `_vimrc`,`_gvimrc`,
   and `vimfiles` in your home directory. You can modify what Vim interprets as
   your home directory by editing your `HOME` environment variable.

1. Install [minpac][].

1. Start Vim. Ignore any errors and run `:PluginInstall`. Exit when finished.

1. Install [YouCompleteMe][ycm-windows]. Make sure to compile with semantic
   support for C-family languages and JavaScript.

1. Download [Powerline fonts][]. Install them by running `install.ps1`.

1. Install remaining utilities:
    ```
    scoop install ripgrep ctags cscope
    ```

1. Happy Vimming!

### macOS

1. Install [MacVim][].

1. Run `symlinks.sh`. This will create create symlinks for `_vimrc`,`_gvimrc`,
   and `vimfiles` in your home directory.

1. Install [minpac][].

1. Start Vim. Ignore any errors and run `:PluginInstall`. Exit when finished.

1. Install [YouCompleteMe][ycm-mac]. Make sure to compile with semantic
   support for C-family languages and JavaScript.

1. Install [Powerline fonts][].

1. Install remaining utilities using [Homebrew][]:
    ```
    brew install ripgrep ctags
    ```

1. Happy Vimming!

## Usage notes

* F5 opens the current file in Chrome. You can install a markdown preview
  extension and then use the mapping while editing markdown files. Make sure
  the extension has been allowed access to file URLs.

[Scoop]: http://scoop.sh/
[minpac]: https://github.com/k-takata/minpac
[ycm-windows]: https://github.com/Valloric/YouCompleteMe#windows
[Powerline fonts]: https://github.com/powerline/fonts
[MacVim]: http://macvim-dev.github.io/macvim/
[ycm-mac]: https://github.com/Valloric/YouCompleteMe#mac-os-x
[Homebrew]: https://brew.sh/
