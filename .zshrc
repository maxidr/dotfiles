# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="miloshadzic"
#ZSH_THEME="mrtazz"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails3 ruby bundler)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/maxi/.rvm/gems/ruby-1.9.3-p0@escapadas/bin:/home/maxi/.rvm/gems/ruby-1.9.3-p0@global/bin:/home/maxi/.rvm/rubies/ruby-1.9.3-p0/bin:/home/maxi/.rvm/bin:/home/maxi/.rvm/bin:/home/maxi/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:"/home/maxi/share/Sublime Text 2/":/home/maxi/.rvm/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

setopt nullglob

[ -s "/home/maxi/.scm_breeze/scm_breeze.sh" ] && source "/home/maxi/.scm_breeze/scm_breeze.sh"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
