alias py='python3'
alias ll='ls -la'
alias ls='ls -F'
alias lk='ls -1F'
alias ..='cd ..'
alias newapp="sh ~/dev/scripts/newapp.sh"
alias frontlib="sh ~/dev/scripts/frontendlib.sh"
alias go='gcc -o'
alias cplint='cp ~/dev/scripts/copy_files/.eslintrc .'
alias gs='git status'
alias gd='git diff'
alias gp='git push'
alias gpl='git pull'
alias als='cat ~/aliases.txt'
alias bsh='source ~/.bash_profile'
alias vim='/usr/local/Cellar/vim/8.0.1400_4/bin/vim'
alias bp='vim ~/.bash_profile'

# bash functions
mycp ()
{
    cplint &&
        cp ~/dev/scripts/copy_files/.gitignore .
}

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

new ()
{
    newapp "$1" &&
        cd "$1"
}

dotenv ()
{
  export $(cat .env | xargs) $*
}

pyenv ()
{
  python3 -m venv ~/dev/python/envs/$1
}

pyactivate ()
{
  . ~/dev/python/envs/$1/bin/activate
}

# Enable tab completion
source ~/.git-completion.sh
# colors!
RESET="\[\033[0m\]"
BOLD="\[\033[1m\]"
WHITE="\[\e[39m\]"
PINK="\[\e[38;5;219m\]"
RED="\[\e[38;5;197m\]"
ORANGE="\[\e[38;5;208m\]"
YELLOW="\[\e[38;5;226m\]"
LIGHT_GREEN="\[\e[92m\]"
GREEN="\[\e[38;5;2m\]"
POWDER_BLUE="\[\e[38;5;153m\]"
BLUE="\[\e[38;5;69m\]"
PURPLE="\[\e[38;5;171m\]"
BLACK="\[\e[38;5;234m\]"
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
  if [[ -n $VIRTUAL_ENV ]]; then
    VIRT_ENV_PROMPT="<<< $(basename $VIRTUAL_ENV) >>> "
  else
    VIRT_ENV_PROMPT="<<<>>> "
  fi
  PS1="$RED$VIRT_ENV_PROMPT$YELLOW\u $BLUE\w$LIGHT_GREEN$(__git_ps1)$WHITE\n$BOLD$RED:$ORANGE:$YELLOW:$GREEN:$BLUE:$PURPLE:$RESET "
}

shopt -u promptvars
PROMPT_COMMAND=update_PS1
