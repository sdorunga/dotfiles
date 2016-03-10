# sets the history file to append mode so you don't lose history on close
shopt -s histappend
# immedietly writes commands to histroy after they're executed
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

PATH="./vendor/bundle/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH=$PATH
alias rspec='be rspec'
alias bi="bundle check || bundle install --path vendor/bundle --jobs 4"
alias bio="bundle check || bundle install --path vendor/bundle"
alias be="bundle exec"
alias server="bundle exec script/server"
alias ctag='ctags -R --languages=ruby --exclude=.git --exclude=log .'
alias console="bundle exec script/console --sandbox"
alias f='foreman run bundle exec'
alias sp="vendor/bundle/bin/spec"
alias reh="eval '$(rbenv init -)';rbenv rehash"
alias tmpair="tmux -S /tmp/pair new -d -s math && chmod 777 /tmp/pair && tmux -S /tmp/pair attach"
alias subl="sublime"
alias t="task"
alias subl=/usr/local/bin/subl
alias g='git'
alias gs='git status'
alias gl='git log'
alias gpl='git pull'
alias gh='git push'
alias gc='git commit'
alias gca='git commit --amend'
alias sicp='racket -i -p neil/sicp -l xrepl'
#alias sts='dtach -n mongod.socket mongod; dtach -n redis.socket redis-server; dtach -n memcached.socket memcached;'
alias c='cdselecta'
function cdselecta { cd $(ls | selecta); }

# emacs stuff
alias e="emacsclient -c"
alias es='emacs -daemon'

export -f cdselecta

export EDITOR="/usr/local/bin/vim"

export HISTFILESIZE=
export HISTSIZE=
export HISTFILE=~/.bash_eternal_history
# colour codes
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
LIGHT_CYAN="\[\033[1;36m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
WHITE="\[\033[0;37m\]"
WHITE_BOLD="\[\033[1;37m\]"
GRAY="\[\033[1;30m\]"
COLOR_NONE="\[\e[0m\]"

# prompt functions
function is_git_repository {
  git branch > /dev/null 2>&1
}

function current_branch {
  git branch 2>/dev/null| sed -n '/^\*/s/^\* //p'
}

function set_git_branch {
  if git rev-parse --git-dir >/dev/null 2>&1
  then
    gitver=$(current_branch)
    if git diff --quiet 2>/dev/null >&2 
    then
      gitver=$GREEN$gitver
    else
      gitver=$RED$gitver
    fi
  else
    return 0
  fi
  echo $gitver
}

function set_bash_prompt {
  if is_git_repository ; then
    GIT="$WHITE_BOLD on $(set_git_branch)"
  else
    GIT=''
  fi

  # HH:MM
  time='\A'

  PS1="$GRAY$time $WHITE\w$GIT $COLOR_NONE\$ "
  PS2='> '
  PS4='+ '
}

PROMPT_COMMAND=set_bash_prompt; $PROMPT_COMMAND



eval "$(rbenv init -)"

#function for git autocomplete
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH="~/go/bin:$PATH"
### Node stuff
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
export FACEBOOK_APP_ID=853246978082738
export FACEBOOK_APP_SECRET=4e041c63820d4614203e82a3960880ab

. `brew --prefix`/etc/profile.d/z.sh

t
