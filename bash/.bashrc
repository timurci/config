test -s ~/.alias && . ~/.alias || true

TC_CYAN="\[\e[1;36m\]"
TC_YELLOW="\[\e[1;33m\]"
TC_RE="\[\e[0;0m\]"
export PS1="${TC_CYAN}\u${TC_RE}@\H ${TC_YELLOW}\W${TC_RE} % "

set -o vi
