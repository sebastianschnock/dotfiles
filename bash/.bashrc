# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#-------------------------------------------------[ COLORS ]

# fancy command prompt
USER_COLOR="1"
if [ $USER == "root" ]; then
    USER_COLOR="1;31"
fi
PS1="\[\e[${USER_COLOR}m\]\u\[\e[0;33m\]@\[\e[34m\]\h\[\e[0m\]:"    # user @ hostname
PS1="$PS1\[\e[32m\]\w\n"                            # path
PS1="$PS1\[\e[33m\]\!"                              # history
PS1="$PS1\[\e[0m\]> "

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# syntax hightlighting for less
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '

#---------------------------------------------------[ VARIOUS SETTINGS ]

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# history settings
HISTCONTROL=ignoredups:ignorespace
shopt -s histappend     # append to history file (for multiple sessions)
HISTSIZE=10000          # how many commands in session
HISTFILESIZE=10000      # how many commands in history file
bind Space:magic-space      # expand to full command on space
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a; history -n"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# load additional aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# load individuel settings (won't get synchronized or overwritten)
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

# set language
LANG="en_US.UTF-8"
LANGUAGE="en_US.UTF-8"
export LANG
export LANGUAGE

#export NVM_DIR="/home/ssno/opt/nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
