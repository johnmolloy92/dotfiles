#!/usr/bin/env sh
# ~/.bash_profile

[[ -s ~/.bashrc ]] && . ~/.bashrc
[[ -s ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -s ~/.bash_functions ]] && . ~/.bash_functions
[[ -s ~/.git-prompt.sh ]] && . ~/.git-prompt.sh

# kubeps1
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
export KUBE_PS1_PREFIX=""
export KUBE_PS1_SUFFIX=""
export KUBE_PS1_SYMBOL_USE_IMG=true
export KUBE_PS1_SYMBOL_ENABLE=true
export KUBE_PS1_SEPARATOR="- "
#[\u@\h \W $(kube_ps1)]\$ 

#		Bash Completion
#   ------------------------------------------------------------
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

prompt() {
	RED="\[\033[0;31m\]"
	GREEN="\[\033[0;32m\]"
	GREENBOLD="\[\033[1;32m\]"
	BLUE="\[\033[0;34m\]"
	PURPLE="\[\033[0;35m\]"
	RESETCOLOR="\[\e[00m\]"
	PS1="\n$BLUE\u | \$(kube_ps1) | $PURPLE@ $GREEN\w $RESETCOLOR$GREENBOLD\$(__git_ps1) \n $BLUE[\#] → $RESETCOLOR "
	export PS2=" | → $RESETCOLOR"
}

prompt

#   Set Paths
#   ------------------------------------------------------------
export PATH="$PATH"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_161)
export PATH=$PATH:/Users/jmolloy/go/bin
export PATH=$PATH:/opt/protobuf/protoc-3.3.0-osx-x86_64/bin
export PATH=$PATH:/usr/local/apache-tomcat-8.0.46
export ECLIPSE_HOME=/Applications/Eclipse.app/Contents/Eclipse

#   Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
export EDITOR=/usr/bin/vim

#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
export BLOCKSIZE=1k

#   Add color to terminal
#   (this is all commented out as I use Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#   ------------------------------------------------------------
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
ssh-add -A 2>/dev/null

#Ignore duplicates
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=2000

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

#Bash completion
#[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export KUBECONFIG=/Users/jmolloy/.kube/config:/Users/jmolloy/.kube/shoot-consus:/Users/jmolloy/.kube/shoot-axeda:/Users/jmolloy/.kube/cluster-nimbus.kubeconfig:/Users/jmolloy/.kube/cluster-cirrus:.kubeconfig:/Users/jmolloy/.kube/cluster-atlas.kubeconfig
export KUBECONFIG=$KUBECONFIG:~/.kube/cluster-cirrus.kubeconfig

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/jmolloy/.sdkman"
[[ -s "/Users/jmolloy/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/jmolloy/.sdkman/bin/sdkman-init.sh"
