. /usr/local/bin/virtualenvwrapper.sh
# If id command returns zero, you’ve root access.
PS1="[\\w] "
# up_one() {
#    pushd ../$1
# }
#alias ../=up_one

alias ..='pushd .. >> /dev/null'
alias ...='pushd ../.. >> /dev/null'
alias ....='pushd ../../.. >> /dev/null'
alias .....='pushd ../../../.. >> /dev/null'
alias ls='ls -U1lshagGF --time-style=+%Y.%m.%d\ %H:%M:%S --color'


