#!/bin/bash

# update all config files from the 'mother source'
function get-config-files {
  local url="http://meineschnocks.de/config-files"
  wget $url/bashrc -qO ~/.bashrc
  wget $url/bash_aliases -qO ~/.bash_aliases
  wget $url/nanorc -qO ~/.nanorc
  wget $url/Default.sublime-theme -qO ~/.config/sublime-text-3/Packages/User/Default.sublime-theme
  wget $url/sublime-settings -qO ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
  wget $url/sublime-keybindings -qO ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap
  wget $url/Distraction\ Free.sublime-settings -qO ~/.config/sublime-text-3/Packages/User/Distraction\ Free.sublime-settings
  source ~/.bashrc
}

# ls
alias ls="ls --group-directories-first --color=auto"
alias l="ls -1"
alias ll="ls -lhF"
alias la="ls -lahF"
alias lll="ll|less"
alias lg="ll|grep"

# change directory improvements
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias cd.....="cd ../../../.."
alias cd......="cd ../../../../.."

# apt
alias ai="sudo apt-get install"
alias au="sudo apt-get update"
alias as="apt-cache search"
alias aug="sudo apt-get upgrade"

# vi
alias vi="vim"
alias svi="sudo vi"

# bash history
alias h="history|tail -100"
alias hg="history|grep"

# ps grep
alias psg="ps -ef|grep"

# various
alias e=subl
alias n=nano
alias rs=rsub

# workaround to make aliases available to sudo (from http://askubuntu.com/a/22043)
alias sd='sudo '
alias sudo='sudo '

# make and change to dir
mcd () { 
    mkdir -p "$@" && eval cd "\"\$$#\"";
}

# create and edit executable file
vix () { 
    touch "$1" && chmod +x "$1" && vi "$1";
}

# perform 'll' after 'cd' if successful.
cdll() {
  builtin cd "$*"
  RESULT=$?
  if [ "$RESULT" -eq 0 ]; then
    ll
  fi
}

# safer rm
#if [ -n "$PS1" ] ; then
#  rm () 
#  { 
#      ls -FCsd "$@"
#      echo 'remove[ny]? ' | tr -d '\012' ; read
#      if [ "_$REPLY" = "_y" ]; then
#          /bin/rm -rf "$@"
#      else
#          echo '(cancelled)'
#      fi
#  }
#fi

# kill process with name
killp () {
    ps -ef|grep $@|grep -v grep|awk '{print $2}'|xargs kill -9
}

# display shortcuts
function keys {
  if [[ -z $1 ]]; then
    echo "Usage: keys program [keyword] "
  fi
  PROGRAM=$1
  KEYWORD=$2
  if [[ -z $2 ]]; then
    curl -s http://meineschnocks.de/keys/$PROGRAM
  else
    curl -s http://meineschnocks.de/keys/$PROGRAM | grep $KEYWORD
  fi
  echo
}

# display howto
function howto {
  if [[ -z $1 ]]; then
    echo "Usage: howto program [keyword] "  
  fi
  PROGRAM=$1
  KEYWORD=$2
  if [[ -z $2 ]]; then
    curl -s http://meineschnocks.de/howto/$PROGRAM
  else
    curl -s http://meineschnocks.de/howto/$PROGRAM | grep $KEYWORD
  fi  
  echo
}

# bash color codes
function bash_colors {
  T="gYw"
  echo -e "\n                 40m     41m     42m     43m\
       44m     45m     46m     47m";

  for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
             '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
             '  36m' '1;36m' '  37m' '1;37m';
    do FG=${FGs// /}
    echo -en " $FGs \033[$FG  $T  "
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
      do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
    done
    echo;
  done
  echo
  echo 'Use like so: echo "\[\e[35m\]TEXT"'
}

# display bash history
function bash_history {
    echo -e "\n\e[1;33mcp   -r   .bashrc   /tmp/bash/\e[0m"
    echo -e "\e[1;44m       !!-       \e[0m"
    echo -e "     \e[1;45m           !!*           \e[0m"
    echo -e "                    \e[1;46m    !!$   \e[0m"
}
