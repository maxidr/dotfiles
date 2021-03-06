My dotfiles
===========

## Clone the repo

    git clone git@github.com:maxidr/dotfiles.git .dotfiles

## Install ZSH

    # install zsh
    sudo apt-get install zsh

    # Set zsh as default
    chsh -s /bin/zsh 

## Install [Oh my zsh!](https://github.com/robbyrussell/oh-my-zsh)

    # Install curl
    sudo apt-get install curl

    # Download and install oh my zsh
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

restart the terminal


## Install tmux

    sudo apt-get install tmux
    
## Install rbenv (for ruby versions)

    sudo apt-get install libssl-dev zlib1g-dev libreadline-dev openssl libopenssl-ruby1.9.1 libcurl4-openssl-dev
    git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

## Restore the dotfiles

    rm .zshrc
    ln -s .dotfiles/.zshrc
    
restart the terminal

### Install vim

    sudo apt-get install vim-nox
    ln -s .dotfiles/vim .vim
    ln -s .dotfiles/.vimrc
    ln -s .dotfiles/.gemrc
    ln -s .dotfiles/.git-completion.sh 
    ln -s .dotfiles/.gitconfig 
    ln -s .dotfiles/.gitignore 
    ln -s .dotfiles/.irbrc 
    ln -s .dotfiles/.pryrc 
    ln -s .dotfiles/.tmux.conf 

    cd .dotfiles
    git submodule init
    git submodule update
    cd ..
    
### Patch fonts for poweline ([from here](https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation))
        
    wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
    mkdir .fonts
    mv PowerlineSymbols.otf .fonts
    fc-cache -vf ~/.fonts
    wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
    mkdir .fonts.conf.d/
    mkdir -p .config/fontconfig/conf.d/
    cp 10-powerline-symbols.conf .fonts.conf.d
    mv 10-powerline-symbols.conf .config/fontconfig/conf.d/
    
Restart the terminal

## Extras

Install heroku toolbelt

    wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
    
