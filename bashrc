alias ll="ls -al"
alias ls="ls -G"
alias be="bundle exec"
alias bundle='http_proxy=http://localhost:3132 bundle'
alias gpp="git pull --rebase && git push"
alias pingloop="ping -i 5 www.google.com"
alias gitalias="git config -l | grep alias"
alias start_postgres="postgres -D /usr/local/var/postgres"

export PATH=/usr/local/bin:$PATH:~/bin:~/.rvm/bin
export BUNDLER_EDITOR=mvim

# Ruby optimizations
export RUBY_HEAP_MIN_SLOTS=600000 # this is deprecated in Ruby 2.1, replaced by the following variable
export RUBY_GC_HEAP_INIT_SLOTS=600000
export RUBY_GC_MALLOC_LIMIT=59000000
export RUBY_HEAP_FREE_MIN=100000

# powerline-shell (https://github.com/milkbikis/powerline-shell)
function _update_ps1() {
  export PS1="$(~/tools/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}
export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

if [ -f ~/.dotfiles/local/bashrc ]
then
  source ~/.dotfiles/local/bashrc
fi
