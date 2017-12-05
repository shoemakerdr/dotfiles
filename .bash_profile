alias py='python3'
alias ll='ls -la'
alias ls='ls -F'
alias lk='ls -1F'
alias ..='cd ..'
alias go='gcc -o'
alias gs='git status'
alias gd='git diff'
alias gp='git push'
alias gpl='git pull'
alias bsh='source ~/.bash_profile'
alias bedit='vim ~/.bash_profile'

gac ()
{
    git add "$1" &&
        git commit -m "$2"
}

mkcd ()
{
    mkdir -p -- "$1" &&
        cd -P -- "$1"
}

# Enable tab completion
source ~/.git-completion.sh

# colors!
LIGHT_GREEN="\[\e[92m\]"
GREEN=$(tput setaf 2)
POWDER_BLUE=$(tput setaf 153)
RESET="\[\033[0m\]"
WHITE="\[\e[39m\]"
PINK="\[\e[38;5;219m\]"
YELLOW="\[\e[38;5;226m\]"
BLACK="\[\e[38;5;234m\]"
BLUE="\[\e[38;5;33m\]"
BLUE_BACKGROUND="\[\e[48;5;33m\]"
PINK_BACKGROUND="\[\e[48;5;219m\]"
LIGHT_GREEN_BACKGROUND="\[\e[48;5;92m\]"
POWDER_BLUE_BACKGROUND="\[\e[48;5;153m\]"
# Change command prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
# export PS1="$PINK\u $LIGHT_GREEN\W$POWDER_BLUE$(__git_ps1) $WHITE\e[44m->$RESET "
# export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

update_PS1 () {
  PS1="$PINK\u $LIGHT_GREEN\w$POWDER_BLUE$(__git_ps1)$WHITE\n$BLUE_BACKGROUND->$RESET "
}
shopt -u promptvars
PROMPT_COMMAND=update_PS1
