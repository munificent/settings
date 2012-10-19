# Add ~/bin to path.
export PATH="$PATH":~/bin

# Add Chrome depot_tools to path.
export PATH="$PATH":~/dev/depot_tools

# Add my live built version of the Dart SDK to path.
export PATH="$PATH":~/dev/dart/dart/xcodebuild/ReleaseIA32/dart-sdk/bin

# Add bash completion for git.
# See: https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Set up my prompt including git hotness.
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export PS1='\[\033[37m\]\w$(__git_ps1 " \[\033[32m\](%s)")\[\033[0m\] → '
