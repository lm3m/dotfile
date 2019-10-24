# If id command returns zero, you’ve root access.
PS1="[\\w] "

alias ..='pushd .. >> /dev/null'
alias ...='pushd ../.. >> /dev/null'
alias ....='pushd ../../.. >> /dev/null'
alias .....='pushd ../../../.. >> /dev/null'
alias ls='/usr/local/opt/coreutils/libexec/gnubin/ls -1lshagGF --time-style=+%Y.%m.%d\ %H:%M:%S --color'
alias ldiff='git difftool -y'
alias lclean='find . -name "*.pyc" -exec rm -rf {} \;'
alias lssh='ssh -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no 2>/dev/null'
alias lscp='scp -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no 2>/dev/null'
alias less='/usr/bin/less -XFR'
alias lemacs='emacs -nw'
# have to escape all the double quotes and the inputs
alias lmdorg="find . -name \*.md -type f -exec sh -c 'pandoc  -f markdown -t org -o \"\${1%.md}.org\" \"\$1\"' sh {} \;"

export CHEATCOLORS=true
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_201.jdk/Contents/Home
export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.7.1.1/
export PYTHONPATH=/usr/local/Cellar/pygtk/2.24.0:$PYTHONPATH
#bind '"\t":menu-complete'
export PATH=/usr/local/Cellar/nano/2.3.6/bin/:$PATH
export PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH
source ~/.bash_prompt
