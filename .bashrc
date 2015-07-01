. /usr/local/bin/virtualenvwrapper.sh
# If id command returns zero, you’ve root access.
PS1="[\\w] "

alias ..='pushd .. >> /dev/null'
alias ...='pushd ../.. >> /dev/null'
alias ....='pushd ../../.. >> /dev/null'
alias .....='pushd ../../../.. >> /dev/null'
alias ls='ls -U1lshagGF --time-style=+%Y.%m.%d\ %H:%M:%S --color'
alias ldiff='git difftool -y'
alias lclean='find . -name "*.pyc" -exec rm -rf {} \;'
alias lssh='ssh -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no 2>/dev/null'
alias lscp='scp -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no 2>/dev/null'

export CHEATCOLORS=true
export AWS_ACCESS_KEY=AKIAJOSCUWCQHH34N5Fa 
export AWS_SECRET_KEY=cCmO1rdckJsWHa/Mu7horMAz6ihBwGOGyFHMO6i2
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_11.jdk/Contents/Home
export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.7.1.1/
export PYTHONPATH=/usr/local/Cellar/pygtk/2.24.0:$PYTHONPATH
#bind '"\t":menu-complete'
export PATH=/usr/local/Cellar/nano/2.3.6/bin/:$PATH
source ~/.bash_prompt
