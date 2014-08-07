if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then 
	. /usr/local/bin/virtualenvwrapper.sh
fi
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
if [ -f /opt/local/bin/gls ]; then
    alias ls='gls -U1lshagGF --time-style=+%Y.%m.%d\ %H:%M:%S --color'
else
    alias ls='ls -U1lshagGF --time-style=+%Y.%m.%d\ %H:%M:%S --color'

fi
source ~/.bash_prompt
