# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# ZSH Theme
ZSH_THEME="wedisagree"

# plugins
plugins=(git rails textmate ruby lighthouse gem ant bundler battery git-flow github heroku jruby mvn node python rails3 rake ssh-agent thor yum rvm lein)

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Torquebox and JBOSS related settings
export JRUBY_OPTS=--1.9
export TORQUEBOX_HOME=$HOME/torquebox-2.1.2
export JBOSS_HOME=$TORQUEBOX_HOME/jboss

# Export Emacs-24.3.50 as default editor

export EDITOR=emacs-24.3.50
# Adding rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# My Custom aliases

alias jem='jruby -S gem install'
alias jspec='jruby -S rspec'
alias gitkall='gitk --all'
alias ruby19='rvm use 1.9.3'
alias ruby2='rvm use 2.0.0-p0'
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
alias er="/home/cha1tanya/Projects/sources/rails/railties/bin/rails"
alias ecoffee="/home/cha1tanya/Projects/sources/coffee-script/bin/coffee"
alias ecake="/home/cha1tanya/Projects/sources/coffee-script/bin/cake"
alias r="rails"
alias be="bundle exec"
# Custom PATHs 

# ~/bin
export PATH=$PATH:/home/cha1tanya/bin/
# SML
export PATH=$PATH:/usr/local/sml/bin/
# Coursera downloader
export PATH=$PATH:/home/cha1tanya/Projects/fun/coursera
# JRuby development
export PATH=$PATH:/home/cha1tanya/Projects/sources/jruby/bin/
# Heroku
export PATH=$PATH:/usr/local/heroku/bin
# Scala
export PATH=$PATH:/home/cha1tanya/Projects/scala-coursera/sbt/bin
# Android
export PATH=$PATH:/home/cha1tanya/Projects/sources/adt-bundle-linux-x86_64/sdk/tools
export PATH=$PATH:/home/cha1tanya/Projects/sources/adt-bundle-linux-x86_64/sdk/platform-tools
export PATH=$PATH:/home/cha1tanya/Projects/sources/adt-bundle-linux-x86_64/eclipse
# Vertx
export PATH=$PATH:/home/cha1tanya/Projects/sources/vert.x-1.3.1.final/bin
# RCodeTools
export PATH=$PATH:/home/cha1tanya/Projects/sources/rcodetools/bin
# Amazon EB
export PATH=$PATH:/home/cha1tanya/Projects/sources/AWS-ElasticBeanstalk-CLI-2.3.1/eb/linux/python2.7
# coffee-script edge
export PATH=$PATH:/home/cha1tanya/Projects/sources/coffee-script/bin
# ------------------------------------------------------------------------------------------

# Torquebox Bug
export CLASSPATH=$CLASSPATH:/home/cha1tanya/.rvm/gems/jruby-1.6.8@torked/gems/jdbc-mysql-5.1.22/lib/mysql-connector-java-5.1.22.jar
