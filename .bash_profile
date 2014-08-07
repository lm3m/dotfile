if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then 
	. /usr/local/bin/virtualenvwrapper.sh
fi
# If id command returns zero, you’ve root access.
#PS1="[\\w] "
#PS1="\e[1m[\t] \w :\e[m "
PS1="[\t] \w : "
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# up_one() {
#    pushd ../$1
# }
#alias ../=up_one

alias ..='pushd .. >> /dev/null'
alias ...='pushd ../.. >> /dev/null'
alias ....='pushd ../../.. >> /dev/null'
alias .....='pushd ../../../.. >> /dev/null'
#alias ls='ls -U1lshagGF --time-style=+%Y.%m.%d\ %H:%M:%S --color'

source ~/.bash_prompt
