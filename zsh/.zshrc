# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# ZSH Theme
ZSH_THEME="frisk"

# plugins
plugins=(git rails textmate ruby lighthouse gem ant bundler battery git-flow github heroku jruby mvn node python rails3 rake ssh-agent thor yum rvm lein)

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Torquebox and JBOSS related settings
export JRUBY_OPTS=--1.9
export TORQUEBOX_HOME=$HOME/torquebox-2.1.2
export JBOSS_HOME=$TORQUEBOX_HOME/jboss

# Export Emacs-24.3.50 as default editor
export EDITOR=emacs-24.3
export ALTERNATE_EDITOR=""

# Adding rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# My Custom aliases

alias jem='jruby -S gem'
alias jspec='jruby -S rspec'
alias jrails='jruby -S rails'
alias jrake='jruby -S rake'
alias gitkall='gitk --all'
alias ruby19='rvm use 1.9.3'
alias ruby2='rvm use 2.0.0-p0'
alias gd='git diff --word-diff'
alias gstsh='git stash'
alias src='source'
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
alias irb="irb --simple-prompt"
alias et='emacsclient -t'
alias ec='emacsclient -c'

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
export PATH=$PATH:/home/cha1tanya/Projects/sources/scala-2.9.3/bin/
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
# rvm
export PATH=$PATH:$HOME/.rvm/bin
# sbt
export PATH=$PATH:$HOME/home/cha1tanya/bin/sbt/bin/sbt
#rubinius
#export PATH=$PATH:/home/cha1tanya/Projects/sources/rubinius/bin
# Go
export PATH=$PATH:/usr/local/go/bin
# gopath
export GOPATH=/home/cha1tanya/gocode
# javafx
export JFX_DIR=/home/cha1tanya/Downloads/JavaFXSceneBuilder1.1/runtime/jre/lib
# heroku
export PATH=$PATH:/home/cha1tanya/bin/heroku-client/bin
# Cask
export PATH=$PATH:/home/cha1tanya/.cask/bin

# ZSH and emacs

if [ -n "$INSIDE_EMACS" ]; then
  chpwd() { print -P "\033AnSiTc %d" }
  print -P "\033AnSiTu %n"
  print -P "\033AnSiTc %d"
fi

prompt_eterm_precmd () {
  case $TERM in
    xterm*)
      print -Pn "\e]0;%n@%m:%~ (%l)\a"
      ;;
    eterm-color*)
      print -P "\eAnSiTh %m"
      print -P "\eAnSiTu %n"
      print -P "\eAnSiTc %~"
      ;;
  esac
}

if [ "${TERM}x" = "eterm-colorx" ]
then
  alias e='print -P "\eAnSiTe"'
  alias x='print -P "\eAnSiTx"'
else
  alias e='emacsclient -n -t -a vim'
fi
