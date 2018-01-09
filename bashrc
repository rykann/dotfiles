if [ -f ~/.aliases ]; then
  . ~/.aliases
fi
[[ $(which gtar) ]] && alias tar="gtar"

export PATH=/usr/local/bin:$PATH:~/bin
export BUNDLER_EDITOR=vim

# Ruby optimizations
export RUBY_HEAP_MIN_SLOTS=600000 # this is deprecated in Ruby 2.1, replaced by the following variable
export RUBY_GC_HEAP_INIT_SLOTS=600000
export RUBY_GC_MALLOC_LIMIT=59000000
export RUBY_HEAP_FREE_MIN=100000

# Tomcat 8
#export JAVA_HOME=`/usr/libexec/java_home`
#export CATALINA_HOME=/usr/local/Cellar/tomcat/8.0.8/libexec

# powerline-shell (https://github.com/milkbikis/powerline-shell)
function _update_ps1() {
  export PS1="$(~/tools/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}
export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

# powerline
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh

# nicely format JSON curl responses
function jcurl() { curl -s -S $@ | python -m json.tool; }

if [ -f ~/.dotfiles/local/bashrc ]
then
  source ~/.dotfiles/local/bashrc
fi

# git completion
source ~/.dotfiles/bin/git-completion.sh
__git_complete gco _git_checkout
__git_complete gb _git_branch

# SBT Options (Scala Build Tool)
export SBT_OPTS="-Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=2G -Xss2M"
