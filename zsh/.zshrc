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
