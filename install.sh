#!/bin/bash
INSTALLDIR=${INSTALLDIR:-"$PWD/dot-files"}

##### Set up vimified #####
if [ ! -d ~/vimified ]; then
    # Directory to set vim files.
    VIM=~/vimified
    # Clone vimified.
    git clone git://github.com/zaiste/vimified.git $VIM
    # Create pointers to vim files.
    ln -sfn $VIM ~/.vim
    ln -sfn $VIM/vimrc ~/.vimrc
    # Create directory to set up dependency bundles.
    mkdir -p $VIM/bundle
    # Create directory to set up temporary files.
    mkdir -p $VIM/tmp/backup
    mkdir -p $VIM/tmp/swap
    mkdir -p $VIM/tmp/undo
    # Clone vundle.
    git clone https://github.com/gmarik/vundle.git $VIM/bundle/vundle
    # Basic package list.
    cp $INSTALLDIR/vim/local.vimrc $VIM
    # Install basic packages.
    cd $VIM
    vim +BundleInstall +qall
    # Install solarized theme.
    # This theme is only available after the bundle install.
    cp $INSTALLDIR/vim/after.vimrc $VIM
    # Move back to home folder.
    cd
fi

##### Set up tmux #####
if [ ! -d ~/.tmux/plugins/tpm ]; then
    # Clone tpm.
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
# Copy .tmux.conf
cp $INSTALLDIR/tmux/tmux.conf ~/.tmux.conf

##### Set up bash #####
cp $INSTALLDIR/bash/bash_profile ~/.bash_profile
cp $INSTALLDIR/bash/bash_aliases ~/.bash_aliases
source ~/.bash_profile
