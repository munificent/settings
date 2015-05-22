# Put homebrew packages before system ones.
export PATH="/usr/local/bin:$PATH"

# Add ~/bin to path.
export PATH="$PATH":~/bin

# Add this repo's scripts to path.
export PATH="$PATH":~/dev/settings/scripts

# Add Chrome depot_tools to path.
export PATH="$PATH":~/dev/depot_tools

# Add Dart repo's SDK to path.
export PATH="$PATH":~/dev/dart/sdk/bin

# Add pub binstubs to path.
export PATH="$PATH":~/.pub-cache/bin

# Add bash completion for git.
# See: https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Set up directory marking commands.
# See: http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
# And: https://news.ycombinator.com/item?id=6229001
export MARKPATH=$HOME/.marks
function jump {
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
    rm -i "$MARKPATH/$1"
}
function marks {
    \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}

function _jump {
    local cur=${COMP_WORDS[COMP_CWORD]}
    local marks=$(find $MARKPATH -type l | awk -F '/' '{print $NF}')
    COMPREPLY=($(compgen -W '${marks[@]}' -- "$cur"))
    return 0
}
complete -o default -o nospace -F _jump jump

# Set up my prompt including git hotness.
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export PS1='\[\033[37m\]\w$(__git_ps1 " \[\033[32m\](%s)")\[\033[0m\] → '
