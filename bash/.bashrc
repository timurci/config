# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

TC_CYAN="\[\e[1;36m\]"
TC_ORANGE="\e[38;5;208m"
TC_YELLOW="\[\e[1;33m\]"
TC_RE="\e[0;0m"
test -s ~/.alias && . ~/.alias || true

if [ -f $HOME/Documents/scripts/bash-git.sh ]; then
	source $HOME/Documents/scripts/bash-git.sh
	export PS1="${TC_CYAN}\u${TC_RE}@\H ${TC_ORANGE}\W${TC_RE} \$(git_return 1 1 1 ! + '(' ')' '\e[33m') \n% "
else
	export PS1="${TC_CYAN}\u${TC_RE}@\H ${TC_ORANGE}\W${TC_RE} \n% "
fi


alias update="sudo zypper ref && sudo zypper dup || echo -e \"${TC_ORANGE} Error while updating. ${TC_RE}\n\""
export QT_STYLE_OVERRIDE=Adwaita-Dark

alias vim=nvim

export PATH+=":~/MATLAB/R2023a/bin/"

export GUROBI_HOME="/opt/Gurobi/gurobi1001/linux64"
export PATH="${PATH}:${GUROBI_HOME}/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
export GUROBI_PATH="${GUROBI_HOME}"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi
