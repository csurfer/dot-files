#!/bin/bash
INSTALLDIR=${INSTALLDIR:-"$PWD/dot-files"}

##### Set up vimified #####

# Fetch vimified git repository
cd
if [ ! -d vimified ]; then
    git clone git://github.com/zaiste/vimified.git
    ln -sfn vimified/ ~/.vim
    ln -sfn vimified/vimrc ~/.vimrc
fi
cd vimified

# Create directory to set up dependency bundles
mkdir -p bundle
mkdir -p tmp/backup tmp/swap tmp/undo

# Setup Vundle to procure dependency bundles
if [ ! -d bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git bundle/vundle
fi

# Copy *.vimrc files into vimified
cp $INSTALLDIR/vim/local.vimrc .
cp $INSTALLDIR/vim/after.vimrc .

vim +BundleInstall +qall 2>/dev/null

##### Set up tmux #####

# Copy .tmux.conf
cd
cp $INSTALLDIR/tmux/tmux.conf ~/.tmux.conf

##### Set up bash #####

# Copy BASH files.
cd
cp $INSTALLDIR/bash/bash_profile ~/.bash_profile
cp $INSTALLDIR/bash/bash_aliases ~/.bash_aliases
source ~/.bash_profile
