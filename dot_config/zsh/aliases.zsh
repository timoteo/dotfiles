#!/bin/sh

# Vim
alias v='nvim'
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"


# alias lvim='nvim -u ~/.local/share/lunarvim/lvim/init.lua --cmd "set runtimepath+=~/.local/share/lunarvim/lvim"'

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Chezmoi
# add local files that have changed
alias cmal="chezmoi status | sed -e 's/MM //' | xargs chezmoi add"
alias cma='chezmoi add'
alias cme='chezmoi edit'
alias cmdiff='chezmoi diff'
alias cmdata='chezmoi data'
alias cmu='chezmoi update'
alias cmapp='chezmoi apply'
alias cmcd='chezmoi cd'

# Zellij
alias zels='zellij ls'
function zeds() {
    zellij ls | awk '{ print $1 }' | fzf --ansi | xargs zellij delete-session --force
}
function zeas() {
    local session=$(zellij ls | awk '{ print $1 }' | fzf --ansi)
    echo "Attaching to session $session"
    zellij attach $session
}
function zr () { zellij run --name "$*" -- zsh -ic "$*";}
function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}

# Dirs
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Config shortcuts
alias czsh='chezmoi edit ~/.zshrc'
alias cnvim='nvim ~/.config/nvim'
alias calias='chezmoi edit ~/.config/zsh/aliases.zsh'
alias cexport='chezmoi edit ~/.config/zsh/exports.zsh'
alias rezsh='source ~/.zshrc'
alias cwezterm='chezmoi edit ~/.config/wezterm/wezterm.lua'
alias czellij='chezmoi edit ~/.config/zellij/config.kdl'
alias cstarship='chezmoi edit ~/.config/starship/starship.toml'

# Git
alias gc='git commit -m'
alias gca='git commit --amend -m'
alias gp='git push'
alias gpl='git pull'
alias gs='git status'
alias ga='git add -p'
alias gadd='git add'
alias gdiff='git diff'
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"

function open_url() {
    if [ $# -ne 1 ]; then
        echo "Usage: open_url <url>"
        return 1
    fi
    
    if command -v xdg-open &> /dev/null; then
        xdg-open "$1"
    elif command -v open &> /dev/null; then
        open "$1"
    elif [ -n "$BROWSER" ]; then
        "$BROWSER" "$1"
    else
        echo "URL: $pr_url"
        echo "Please open the URL in your browser."
    fi
}

function gfeat() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: gfeat <feature-name>"
        return 1
    fi

    # Define the feature branch name
    local feature_branch="feature/$1"

    # Ensure the current directory is a Git repository
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        echo "Error: must be run in a Git repository"
        return 1
    fi

    # Switch to the develop branch
    git checkout develop

    # Pull the latest changes
    git pull origin develop

    # Create and switch to the new feature branch
    git checkout -b "$feature_branch"

    # Push the new feature branch to the remote origin and set upstream
    git push -u origin "$feature_branch"
}

function gfeatpr {
    if [ $# -lt 2 ]; then
        echo "Usage: gfeatpr <title> <body>"
        return 1
    fi

    # Extract title and body from the command line arguments
    local title="$1"
    local body="$2"

    # Create a pull request with 'gh' CLI and capture the output
    local pr_url=$(gh pr create --base develop --title "$title" --body "$body")

    if [ -z "$pr_url" ]; then
        echo "Failed to create PR"
        return 1
    fi

    echo "Pull Request created: $pr_url"
    open_url "$pr_url"
}

alias http='xh'

# Eza
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"

# Navigation
cx() { cd "$@" && l; }
fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | pbcopy }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }
fev() { nvim "$(fd . --type f -e $1 | fzf)" }

function touchd() {
  local file_path="$1"
  if [ -n "$file_path" ]; then
    local dir_path=$(dirname "$file_path")
    mkdir -p "$dir_path" && touch "$file_path"
    echo "Created file: $file_path"
  else
    echo "Please provide a file path as an argument."
    return 1
  fi
}

# Java
alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"
alias j11="export JAVA_HOME=`/usr/libexec/java_home -v 11`; java -version"
alias j17="export JAVA_HOME=`/usr/libexec/java_home -v 17`; java -version"
alias j19="export JAVA_HOME=`/usr/libexec/java_home -v 19`; java -version"

# Ranger
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )

    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}
alias rr='ranger'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# For when keys break
alias archlinx-fix-keys="sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys"

# systemd
alias mach_list_systemctl="systemctl list-unit-files --state=enabled"

alias mach_java_mode="export SDKMAN_DIR="$HOME/.sdkman" && [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh""

alias brave="/Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser"

if [[ $TERM == "xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"
fi

case "$(uname -s)" in

Darwin)
    # echo 'Mac OS X'
    alias ls='ls -G'
    ;;

Linux)
    alias ls='ls --color=auto'
    ;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
    # echo 'MS Windows'
    ;;
*)
    # echo 'Other OS'
    ;;
esac
