#!/bin/bash
# Installation script to set up your terminal with vimified(with solarized dark
# theme), tmux in 256 colour and helpful bash profile.
INSTALLDIR=${INSTALLDIR:-"$PWD/dot-files"}

##### Easy logging. #####
log () {
    echo "[INFO] "$1
}

##### Set up vim. #####
set_vim () {
    # Directory to set vim files.
    VIM=~/vimified
    log "Starting vim configuration."
    # Execute the following only if vimified is not set.
    if [ ! -d ~/vimified ]; then
        log "Setting up vimified."
        # Clone vimified.
        git clone git://github.com/zaiste/vimified.git $VIM
        # Create pointers to vim files.
        log "Creating links."
        ln -sfn $VIM ~/.vim
        ln -sfn $VIM/vimrc ~/.vimrc
        # Create directory to set up dependency bundles.
        mkdir -p $VIM/bundle
        # Create directory to set up temporary files.
        mkdir -p $VIM/tmp/backup
        mkdir -p $VIM/tmp/swap
        mkdir -p $VIM/tmp/undo
        # Clone vundle.
        log "Setting up vundle packages."
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
    else
        log "vimified already set. Doing nothing."
    fi
    log "vim configuration done."
}

##### Set up tmux. #####
set_tmux () {
    # tmux checks before proceeding.
    if [ -z `which tmux` ]; then
        log "Please install tmux before continuing."
        return
    fi
    if [ `tmux -V | cut -d' ' -f2` \< "2.0" ]; then
        log "tmux version > 1.9 required."
        return
    fi
    # Configuring tmux.
    log "Starting tmux configuration."
    if [ ! -d ~/.tmux/plugins/tpm ]; then
        log "Setting up tpm."
        # Clone tpm.
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    else
        log "tpm already set. Doing nothing."
    fi
    # Copy .tmux.conf
    log "Copying tmux conf file."
    cp $INSTALLDIR/tmux/tmux.conf ~/.tmux.conf
}

##### Set up bash. #####
set_bash () {
    log "Copying bash files."
    cp $INSTALLDIR/bash/bash_profile ~/.bash_profile
    if [ -f ~/.bash_aliases ]; then
        log "Copying pre-existing bash_aliases to bash_extras."
        cat ~/.bash_aliases >> ~/.bash_extras
    else
        log "Add your changes to bash_extras if needed."
        touch ~/.bash_extras
    fi
    cp $INSTALLDIR/bash/bash_aliases ~/.bash_aliases
    source ~/.bash_profile
}

##### ToDo. #####
show_help () {
    log 'Follow the steps to enable the settings :'
    log '0. Source bash profile with `source ~/.bash_profile`'
    log '1. Start a tmux session with `tmux`'
    log '2. Source tmux conf file as `tmux source ~/.tmux.conf`'
    log '3. Ctrl + B followed by Shift + I'
}

##### Call required functions. #####
set_vim
set_tmux
set_bash
show_help
