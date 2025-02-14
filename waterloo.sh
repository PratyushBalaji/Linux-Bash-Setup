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

# colorful prompt
PS1="\[\033[01;32m\]\u@\h:\[\033[01;34m\]\w \[\033[01;33m\]\t\[\033[00m\]\$ "
export PATH="$PATH:$HOME/bin"

# messages for next login
MESSAGE='FINISH MARKDOWN CLI PREVIEW UTILITY'
RED='\033[0;31m'
if [[ $- == *i* ]]; then
   echo -e "${RED}${MESSAGE}"
fi
