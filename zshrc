# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
HOMEBREW_HOME=/usr/local

# ZSH_THEME="agnoster" #Nice prompt maybe a little busy
# ZSH_THEME="bira" 
# ZSH_THEME="agnoster" 
# ZSH_THEME="avit" 
# ZSH_THEME="sorin" 
# ZSH_THEME="simple" 
ZSH_THEME="dpoggi" 

plugins=(osx brew vagrant zsh-completions gem)

source $ZSH/oh-my-zsh.sh

set -o vi

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export EDITOR="mvim -f"

# fastlane variables
export DELIVER_USER="ebruning@gmail.com"
export FASTLANE_TEAM_ID="GEF98ZHGFB"
export XCODE_INSTALL_PASSWORD=
export XCODE_INSTALL_USER=ebruning@gmail.com
export GIT_URL="git://git@bitbucket.org:kofax/match.git"

# android variables
# export ANDROID_SDK="/Users/ethan/Library/Android/sdk"
export ANDROID_SDK="$HOME/Library/Android/sdk/"
export ANDROID_SDK_HOME="$HOME/"

export PATH="$HOME/bin:/usr/local/bin:$HOME/.rbenv/bin:$HOME/.cask/bin:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$PATH"
fpath=(/usr/local/share/zsh-completions $fpath)

# Alias
[ -d "$HOMEBREW_HOME/opt/macvim/MacVim.app" ] && alias v="vimer -t"
[ -d "$HOME/Applications/Atom.app" ] && alias a=atom
[ -f "$HOMEBREW_HOME/bin/hub" ] && alias git=hub
[ -f "$HOMEBREW_HOME/bin/emacs" ] && alias e='open /Applications/Emacs.app $1'

unsetopt correctall

# RBENV
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

function xc {
    xcode_proj=`find . -name "*.xc*" -d 1 | sort -r | head -1`

    if [[ `echo -n $xcode_proj | wc -m` == 0 ]]
    then
        echo "No xcworkspace/xcodeproj file found in the current directory."
    else
        open "$xcode_proj"
    fi
}

function dnsflush {
  sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
  sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
}

function jsonpp () { cat "$@" | python -mjson.tool | pygmentize -l json  }

function build_project {
 xcbuild |xcpretty 
}
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Go settings
export GOPATH=/Users/ethan/go
export PATH=$GOPATH/bin:$PATH
