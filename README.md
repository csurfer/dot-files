# dot-files
Collection of dot-files I use to configure my vim, bash and tmux. Constructed over time, by adding snippets, written by me and by generous authors in various forums on the internet.

## Mac and Linux support
Subtle command differences between Mac and Linux shell environments (rsync etc) are handled by the scripts.

## Installation for the lazy
- Download or clone the repository with 
``` bash
git clone https://github.com/csurfer/dot-files.git
```
- Set execution permission on `dot-files/install.sh`
- Execute `./dot-files/install.sh` to set up all the environments.
- Execute `source ~/.bash_profile` to enable bash settings.
- Enter a tmux session by using `tmux` and then `tmux source ~/.tmux.conf` to enable tmux settings.

## What is set ?
- vim
-- Sets [vimified](https://github.com/zaiste/vimified)
-- Sets [solarized-dark](https://github.com/altercation/vim-colors-solarized) theme
- tmux
- bash
