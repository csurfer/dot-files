#!/bin/bash
INSTALLDIR=${INSTALLDIR:-"$PWD/dot-files"}

##### Set up vimified #####

# Fetch vimified git repository
cd
git clone git://github.com/zaiste/vimified.git
ln -sfn vimified/ ~/.vim
ln -sfn vimified/vimrc ~/.vimrc
cd vimified

# Create directory to set up dependency bundles
mkdir bundle
mkdir -p tmp/backup tmp/swap tmp/undo

# Setup Vundle to procure dependency bundles
git clone https://github.com/gmarik/vundle.git bundle/vundle

vim +BundleInstall +qall 2>/dev/null

# Copy *.vimrc files into vimified
cp $INSTALLDIR/vim/local.vimrc .
cp $INSTALLDIR/vim/after.vimrc .

##### Set up tmux #####

# Copy .tmux.conf
cd
cp $INSTALLDIR/tmux/tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf
