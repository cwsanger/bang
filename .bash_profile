export JAVA_HOME=$(/usr/libexec/java_home)
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PATH=/Users/csanger/Projects/stealthwatch/local-docker-stack/bin:$PATH
source ~/Projects/tools/local-docker-stack/shell/docker.sh

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export UI_HOST='csanger.www.integration.swce-dev.com:32443'
export GW_HOST='csanger.data.integration.swce-dev.com:32443'

export GREP_OPTIONS='--color=auto'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

if [ -f /usr/local/share/gitprompt.sh ]; then
    GIT_PROMPT_THEME=Default
    . /usr/local/share/gitprompt.sh
  fi

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
	__GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
	source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

YELLOW="\001\e[m\002"
WHITE="\001\e[01m\002"
GREEN="\001\e[0;32m\002"
BROWN="\001\e[1;30m\002"
BLUE="\001\e[0;34m\002"
PINK="\001\e[1;35m\002"

git_color() {
  
  local git_status="$(git status 2> /dev/null)"

  if [[ $git_status =~ "nothing to commit" ]]; then
    echo -e "$GREEN"
  elif [[ $git_status =~ "not staged" ]]; then
    echo -e "$BROWN"
  elif [[ $git_status =~ "to be committed" ]]; then
    echo -e "$BLUE"
  else
    echo -e "$PINK"
  fi
}

git_branch() {
  echo -e "$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')"
}

export PS1="$WHITE\u$YELLOW:\W\$(git_color)\$(git_branch)$YELLOW $ "

eval "$(rbenv init -)"

alias stash-and-clear="git add . && git stash && git stash clear"

alias claer="clear"

