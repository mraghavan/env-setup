# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

w_on_gr="\[\e[38;5;231;48;5;237m\]"
w_on_purple="\[\e[38;5;231;48;5;57m\]"
gr_on_purple="\[\e[38;5;237;48;5;57m\]"
grey="\[\e[38;5;237m\]"
teal="\[\e[38;5;23m\]"
bgreen="\[\e[1;32;48;5;237m\]"
byellow="\[\e[1;33;48;5;237m\]"
bred="\[\e[1;31;48;5;237m\]"

_git_untracked="untracked"
_git_clean="clean"
_git_uncommitted="uncommitted"
_git_staged="staged"

# Reset
color_off='\[\e[0m\]'

thin_arrow=$'\u276f'

#PS1="$cyan\t: $green\w \$ $white"

# replace '/' with ' ${thin_arrow} '
function short_pwd()
{
    echo $PWD | sed 's:/Users/manishraghavan:~:' | sed 's:\([^/]*/\).*\([^/]*/[^/]*/[^/]*/[^/]*\):\1...\2:' | sed 's:/: '${thin_arrow}' :g'
}

function _update_prompt()
{
    _in_git=$(git rev-parse &>/dev/null; echo $?)
    if [[ $_in_git == 0 ]]
    then
        if git diff --quiet &>/dev/null
        then
            if git diff-index --quiet --cached HEAD
            then
                _git_status=$_git_clean
                _git_staged_status=""
            else
                _git_status=$_git_staged
                _git_staged_status="~ "
            fi
        else
            _git_status=$_git_uncommitted
            if git diff-index --quiet --cached HEAD
            then
                _git_staged_status=""
            else
                _git_staged_status="~ "
            fi
        fi
    fi
    _git_ut_status=$(get_git_ut_status)
    _git_branch=$(get_git_branch)
}

function get_git_ut_status()
{
    if [[ $_in_git == 0 ]]
    then
        # git ls-files only looks further down the subdirectory
        # untracked files need to start from root dir
        untracked="$(cd "$(git rev-parse --show-toplevel)"; git ls-files --exclude-standard --others --directory)"
        # untracked="$(git status | grep '^# Untracked')"
        if [[ -n "${untracked}" ]]
        then
            echo ' +'
        fi
    fi
}

function get_git_branch()
{
    if [[ $_in_git == 0 ]]
    then
        git symbolic-ref --short -q HEAD
    fi
}

PROMPT_COMMAND=_update_prompt

export PS1="${w_on_gr} \t ${thin_arrow}${w_on_purple} "'$(short_pwd) '${gr_on_purple}${thin_arrow}'$(\
if [ $_in_git -eq 0 ]; then \
    echo -n "$(\
    if [[ "${_git_status}" == "${_git_clean}" ]]; then \
        echo "'$bgreen' ("${_git_branch}${_git_ut_status}") '${thin_arrow}'"; \
    elif [[ "${_git_status}" == "${_git_staged}" ]]
    then
        echo "'$byellow' ["${_git_staged_status}${_git_branch}${_git_ut_status}"] '${thin_arrow}'"; \
    else \
        echo "'$bred' {"${_git_staged_status}${_git_branch}${_git_ut_status}"} '${thin_arrow}'" ;\
    fi)" ; \
fi ; \
echo "'${color_off}${teal}' \$'${color_off}' ")'

# Make bash check its window size after a process completes
shopt -s checkwinsize
# Tell the terminal about the working directory at each prompt.
if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL,
        # including the host name to disambiguate local vs.
        # remote connections. Percent-escape spaces.
	local SEARCH=' '
	local REPLACE='%20'
	local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
	printf '\e]7;%s\a' "$PWD_URL"
    }
    PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
fi


ASCRIPT=$HOME/Developer/Scripts
export DOCPATH=$HOME/Developer/Java/docs
export CLASSPATH=.:$HOME/Developer/Java/jars/*:$HOME/Developer/Java/gjdb/bin

###########
# Aliases #
###########

alias ..="cd .."
alias ...="cd ../.."
alias cp="cp -i"
alias df="df -H"
alias gcc="gcc -Wall"
alias ll="ls -l"
alias ls="ls -AFG"
alias mv="mv -i"
alias p="python3"
alias rm="rm -i"
alias v="vim -O"
alias vlc="open -a VLC"

alias cleandesk="osascript $ASCRIPT/cleandesk.scpt"
alias cdown="mv ~/Downloads/* ~/.Trash"
alias check="ping -o www.google.com"
alias diskspace="du | sort -n -r | more"
alias hiddenoff="defaults write com.apple.Finder AppleShowAllFiles FALSE; killall Finder"
alias hiddenon="defaults write com.apple.Finder AppleShowAllFiles TRUE; killall Finder"
alias ipaddress="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | tail -n 1 | sed 's/.*inet \([^ ]*\) .*/\1/'"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias thachi="osascript -e 'tell app \"System Events\" to sleep'"

set -o vi
set -o allexport

export EDITOR=vim
export HISTIGNORE="&:[ ]*:exit"
export GREP_OPTIONS='--color=auto'

function lx()
{
    file=$(basename "${1}")
    pdflatex -file-line-error -halt-on-error "${file}" && open ${file%.tex}.pdf
}

### GIT ###

function br()
{
    [[ -z "$1" ]] && echo "$0: missing argument" && exit 1
    git branch --track "$1" master
    git checkout "$1"
}

function land()
{
	[[ -z "$1" ]] && BRANCH=$(git rev-parse --abbrev-ref HEAD) || BRANCH="$1"
	[[ "$BRANCH" == "master" ]] && echo "Can't land master" && return 1
	echo "Landing branch $BRANCH"
	echo "Switching to branch master..."
	git checkout master 2>/dev/null || { git checkout master; return 1; }
	echo "Pulling remote changes..."
	git pull || return 2
	echo "Merging $BRANCH into master..."
	git merge "$BRANCH" || return 3
	echo "Pushing changes..."
	git push || return 4
	echo "Cleaning up branch $BRANCH..."
	git branch -d "$BRANCH"
}

[[ -e "${HOME}/.bash_completion" ]] && source "${HOME}/.bash_completion"
