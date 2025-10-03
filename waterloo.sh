# ls aliases
alias ls="ls --color=auto"
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# misc aliases
alias grep="grep --color=auto"
alias cls="clear"
alias rm='rm -i'
#alias gcc='gcc -std=c99 -Wall'

# cpp aliases
alias g++20='g++-14 -std=c++20 -fmodules-ts -Wall -g'
alias g++20h='g++-14 -std=c++20 -fmodules-ts -c -x c++-system-header'

# cs246e setup
source ~cs246e/setup

function gcc() {
  if [[ $# -eq 2 ]]; then
    /usr/bin/gcc -std=c99 -Wall $1 -o $2
  elif [[ $# -eq 1 ]]; then
    /usr/bin/gcc -std=c99 -Wall $1
  else
    /usr/bin/gcc -std=c99 -Wall $@
  fi
}

# marmoset functions
function marmosubmit() {
  if [[ "$1" == cs* ]]; then
    /u/cs_build/bin/marmoset submit "$@"
  else
    /u/cs_build/bin/marmoset submit cs136l "$@"
  fi
}

function marmoresult() {
  if [[ "$1" == cs* ]]; then
    /u/cs_build/bin/marmoset results "$@"
  else 
    /u/cs_build/bin/marmoset results cs136l "$@"
  fi
}

# colorful prompt : user@host:cwd time [gitbranch] \n$
if [ -f /usr/lib/git-core/git-sh-prompt ]; then
  . /usr/lib/git-core/git-sh-prompt
  PS1='\[\033[01;32m\]\u@\h:\[\033[01;34m\]\w \[\033[01;33m\]\t\[\033[01;36m\]$(__git_ps1 " (%s)")\[\033[00m\]\n\$ '
else
  # fallback PS1 if git-prompt not available
  PS1='\[\033[01;32m\]\u@\h:\[\033[01;34m\]\w \[\033[01;33m\]\t\[\033[00m\]\n\$ '
fi

export PS1

export PATH="$PATH:$HOME/bin"

# messages for next login
MESSAGE='THINK ABOUT 246E PROJECT'
RED='\033[0;31m'
if [[ $- == *i* ]]; then
   echo -e "${RED}${MESSAGE}"
fi

function title () {
    echo -ne "\033]0;$*\007"
}
