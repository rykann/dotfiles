alias ga="git add"
alias gb="git branch"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"
alias gci="git commit"
alias gco="git checkout"
alias gcom="git checkout master"
alias gcp="git cherry-pick"
alias gd="git diff"
alias gdc="git diff --cached"
alias gf="git fetch"
alias gpush="git push"
alias gpull="git pull"
alias gs="git status"
alias gsh="git show"
alias gl="git log"
alias gll="git ll"
alias gl1="git log -1"
alias gl3="git log -3"
alias gl5="git log -5"
alias gco="git checkout"
alias gci="git commit"
alias grh="git reset HEAD^"
alias grhh="git reset --hard HEAD^"
alias gw="git whatchanged"
alias gw1="git whatchanged -1"
alias gw3="git whatchanged -3"
alias gw5="git whatchanged -5"
alias gwip="git add . && git commit -m 'wip'"
alias ll="ls -al"
alias ls="ls -G"
alias lr="ls -lrth | tail -10"
alias be="bundle exec"
alias bi="http_proxy=http://localhost:3132 bundle install"
alias gpp="git pull --rebase && git push"
alias pingloop="ping -i 5 www.google.com"
alias gitalias="git config -l | grep alias"
alias gitprune='git checkout --quiet master && git branch --merged | grep --invert-match '\\*' | xargs -n 1 git branch --delete; git checkout --quiet @{-1};'
alias serve="python -m SimpleHTTPServer"
alias start_postgres="postgres -D /usr/local/var/postgres"
[[ $(which gtar) ]] && alias tar="gtar"

export PATH=/usr/local/bin:$PATH:~/bin
export BUNDLER_EDITOR=mvim

# Ruby optimizations
export RUBY_HEAP_MIN_SLOTS=600000 # this is deprecated in Ruby 2.1, replaced by the following variable
export RUBY_GC_HEAP_INIT_SLOTS=600000
export RUBY_GC_MALLOC_LIMIT=59000000
export RUBY_HEAP_FREE_MIN=100000

# Tomcat 8
export JAVA_HOME=`/usr/libexec/java_home`
export CATALINA_HOME=/usr/local/Cellar/tomcat/8.0.8/libexec

# powerline-shell (https://github.com/milkbikis/powerline-shell)
function _update_ps1() {
  export PS1="$(~/tools/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}
export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

# nicely format JSON curl responses
function jcurl() { curl -s -S $@ | python -m json.tool; }

if [ -f ~/.dotfiles/local/bashrc ]
then
  source ~/.dotfiles/local/bashrc
fi

# git completion
source ~/.dotfiles/bin/git-completion.sh

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
alias ch="chruby"
