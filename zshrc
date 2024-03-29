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
alias ec="/usr/local/bin/emacsclient -nw"
alias emacs="/usr/local/bin/emacs"
alias ecgui='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c'
alias org="cd ~/Documents/org/"
alias note="ec ~/Documents/org/notes.org"
alias sdemacs="/usr/local/bin/emacsclient -e \"(kill-emacs)\""
alias jn=emacsclient -nw -e launch-journal
alias R=R --no-save --no-restore

export SSH_KEY_PATH="~/.ssh/id_rsa"
source /Users/gonzalorivero/.iterm2_shell_integration.zsh
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh


# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
