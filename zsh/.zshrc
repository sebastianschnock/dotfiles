#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# add personal bin folder
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# load aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# load local config(s)
for f in ~/.zshrc.local*; do source $f; done

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# rename iterm tab
function title {
    echo -ne "\033]0;"$*"\007"
}

# the cow remembers
cat ${HOME}/.cowsay | cowsay -f $(ls /usr/local/Cellar/cowsay/*/share/cows/*.cow | gshuf -n1) -p -n
