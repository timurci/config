TC_CYAN="\[\e[1;36m\]"
TC_ORANGE="\e[38;5;208m"
TC_YELLOW="\[\e[1;33m\]"
TC_RE="\e[0;0m"
test -s ~/.alias && . ~/.alias || true

# https://github.com/timurci/simple-git-prompt.git
PROMPT_PATH=$HOME/Documents/scripts/simple-git-prompt/bash-git.sh
PYTHON_PATH=$HOME/python_versions/python3.10.12/bin/activate

if [ -f $PROMPT_PATH ]; then
	source $PROMPT_PATH
	export PS1="${TC_CYAN}\u${TC_RE}@\H ${TC_ORANGE}\W${TC_RE} \$(git_return -v -O '(' -C ')' -M '\e[33m' -a + -d - -S M) \n% "
else
	export PS1="${TC_CYAN}\u${TC_RE}@\H ${TC_ORANGE}\W${TC_RE} \n% "
fi

activate_python () {
	if [ -f $PYTHON_PATH ]; then
		source $PYTHON_PATH
	fi
}

alias vim=nvim
alias nopycache="export PYTHONDONTWRITEBYTECODE=1"
