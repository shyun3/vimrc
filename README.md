## Windows installation instructions

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

1. Install [Vundle][]:
    ```
    scoop install git
    scoop install curl
    git clone https://github.com/VundleVim/Vundle.vim.git <vimfiles directory>/bundle/Vundle.vim
    ```

1. Start Vim. Ignore any errors and run `:PluginInstall`. Exit when finished.

1. Install the [YouCompleteMe components][ycm-windows].

1. Download the [Powerline fonts][]. Install them by running `install.ps1`.

1. Install remaining utilities:
    ```
    scoop install ripgrep
    scoop install ctags
    scoop bucket add my-bucket https://github.com/shyun3/my-bucket
    scoop install cscope
    ```
    - [Cscope][] is not currently in the main bucket

1. Happy Vimming!

## Usage notes

* F5 opens the current file in Chrome. You can install a markdown preview
  extension and then use the mapping while editing markdown files. Make sure
  the extension has been allowed access to file URLs.

[Scoop]: http://scoop.sh/
[Vundle]: https://github.com/VundleVim/Vundle.vim
[ycm-windows]: https://github.com/shyun3/ycm-windows
[Powerline fonts]: https://github.com/powerline/fonts
[Cscope]: http://cscope.sourceforge.net/
