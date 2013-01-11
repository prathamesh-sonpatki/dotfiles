# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="wedisagree"

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
plugins=(git rails textmate ruby lighthouse gem ant bundler battery git-flow github heroku jruby mvn node python rails3 rake ssh-agent thor yum rvm lein)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=$PATH:/home/cha1tanya/.rvm/gems/ruby-1.8.7-p352/bin:/home/cha1tanya/.rvm/gems/ruby-1.8.7-p352@global/bin:/home/cha1tanya/.rvm/rubies/ruby-1.8.7-p352/bin:/home/cha1tanya/.rvm/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/cha1tanya/.rvm/bin:/home/cha1tanya/.local/bin:/home/cha1tanya/bin:/home/cha1tanya/.rvm/bin:/home/cha1tanya/.local/bin:/home/cha1tanya/bin
export PATH=$PATH:/home/cha1tanya/Projects/sources/jruby/bin/:/home/cha1tanya/bin/:/usr/local/heroku/bin
export JRUBY_OPTS=--1.9
export PATH=$PATH:/home/cha1tanya/Projects/scala-coursera/sbt/bin
export TORQUEBOX_HOME=$HOME/torquebox-2.1.2
export JBOSS_HOME=$TORQUEBOX_HOME/jboss

# Adding rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# My Custom aliases

alias jem='jruby -S gem install -V --no-ri --no-docs'
alias jspec='jruby -S rspec'
alias gitkall='gitk --all'
alias ruby19='rvm use 1.9.3'
alias gd='git diff --word-diff'
alias gstsh='git stash'
alias src='source'
alias jspec='jruby -S rspec'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias ls='ls --color=always'
alias emacs='emacs -nw'
alias gi='gem install -V'
alias ltr='ls -latr'
alias rake="noglob rake"
alias brake='bundle exec rake'
alias p="passenger"
# edge rails shortcut
alias edge='~/Projects/sources/rails/railties/bin/rails'
