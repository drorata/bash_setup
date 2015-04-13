# Colors definitions
txtdgr='\[\e[1;30m\]' # Dark gray
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtmge='\[\e[0;35m\]' # magenta
txtyel='\[\033[1;33m\]' # yellow
txtrst='\[\e[0m\]'    # Text Reset

# . ~/.bash-ido
# Set a dynamic tab's title for iTerm
export PROMPT_COMMAND='echo -ne "\033]0; ${PWD/#$HOME/~}\007"'

# Python-related settings
export WORKON_HOME=~/Py-Envs
export VIRTUALENVWRAPPER_PYTHON=/opt/local/bin/python
source /opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh

# disable the default virtualenv prompt change
# Taken from:
# http://stackoverflow.com/questions/10406926/how-to-change-default-virtualenvwrapper-prompt
function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "($venv)"
}
export VIRTUAL_ENV_DISABLE_PROMPT=1
VENV="\$(virtualenv_info)";

# Cli Colors - ls output
export CLICOLOR=1
# use yellow for dir’s
export LSCOLORS=dxfxcxdxbxegedabagacad

# Define how Bash prompt looks like:
function parse_git_branch { # taken from https://gist.github.com/henrik/31631
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1]/"
}
export PS1=${txtmge}${VENV}${txtrst}${txtgrn}'[\A:\u@\h]'${txtyel}'\W'${txtdgr}'$(parse_git_branch)'${txtrst}'\n$ '

export PATH=/Users/drorata/bin:${PATH}:/Users/drorata/scripts

## Alias
# General
alias .="pwd"
alias ..="cd .."
alias ll="ls -o -h"
alias rm="rm -i"
alias m="make"
alias cm="cmake"
alias cgrep='grep -nR --color'

# Favorit Directories
alias cgLearning="cd ~/Documents/academics/cgLearning"
alias cgalworking="cd ~/Library/CGAL/src/local_working"

# Programs
alias emacs='open -a /Applications/Emacs.app $1'
alias em='open -a /Applications/Emacs.app $1'

# LaTeX
export TEXMFLOCAL=~/Library/texmf
alias latexmk="latexmk -pdf"
alias latexmkpreview="latexmk -pdf -pvc"
alias latexmkclean="latexmk -pdf && latexmk -c"

#SVN
export LC_ALL=C # this should fix some LC_CTYPE warning
export SVN_EDITOR="emacsclient"
alias commit='svn update && svn commit'
alias status="svn status"
alias update="svn update"

# git
# Add auto completion to git. The file should be found in "contrib/completion"
# of the git source.
source ~/.git-completion.bash

# history handling
# Erase duplicates
export HISTCONTROL=erasedups
# resize history size
export HISTSIZE=10000
# append to bash_history if Terminal.app quits
shopt -s histappend
