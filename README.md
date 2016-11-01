# dot-files
Collection of dot-files I use to configure my vim, bash and tmux. Constructed over time, by adding snippets, written by me and by generous authors in various forums on the internet.

## Mac and Linux support
Subtle command differences between Mac and Linux shell environments (rsync etc) are handled by the scripts.

## Installation
- Download or clone the repository with 
``` bash
git clone https://github.com/csurfer/dot-files.git
```
- Set execution permission on `dot-files/install.sh`
- Execute `./dot-files/install.sh` to set up all the environments.
- Execute `source ~/.bash_profile` to enable bash settings.
- Enter a tmux session by using `tmux` and then `tmux source ~/.tmux.conf` to enable tmux settings.

## What is set ?

### vim
 - Sets [vimified](https://github.com/zaiste/vimified).
 - Sets [solarized-dark](https://github.com/altercation/vim-colors-solarized) theme.

### tmux
 - Sets [base16](https://github.com/chriskempson/base16) theme.
 - Adds Date, Time and Devbox Name to the bottom right. 
- bash (Your `~/.bashrc` is untouched. Your `~/.bash_aliases` will get copied to `~/.bash_extras`. Continue to use `~/.bash_extras` to store your bash shortcuts)
 - Adds checks for `rm` and `cp` so that you do not lose files by mistake.
 - Adds navigation shortcuts i,e `cd .. && cd .. && cd ..` translates to just doing `...`
 - Logs all bash commands executed by you into `~/.logs` in date wise log files. Searching something that you think you executed some time ago is as simple as `hs <search_phrase>`
 - Adds `copy_files` rsync capability to copy directory subtrees from one place to another.
 - Adds `push_git_files` rsync capability to move uncommitted git files around.
