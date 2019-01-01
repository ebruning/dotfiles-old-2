# General settings
ZSH=$HOME/.oh-my-zsh
TERM=xterm-256color
ZSH_THEME="dpoggi" 
source $ZSH/oh-my-zsh.sh
set -o vi
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

case "$(uname -s)" in
# Mac specific
   Darwin)
    HOMEBREW_HOME=/usr/local
    plugins=(osx brew gem vagrant zsh-completions)
    export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

    # fastlane variables
    export DELIVER_USER="ebruning@gmail.com"
    export FASTLANE_TEAM_ID="GEF98ZHGFB"
    export XCODE_INSTALL_PASSWORD=
    export XCODE_INSTALL_USER=ebruning@gmail.com
    export GIT_URL="git://git@bitbucket.org:kofax/match.git"

    # android variables
    export ANDROID_SDK="$HOME/Library/Android/sdk/"
    export ANDROID_SDK_HOME="$HOME/"

    # notwaldorf/tiny-care-terminal
    export TTC_REPOS='~/projects/shadow-war-armageddon-roster'
    export TTC_WEATHER='92832'
    export TTC_CELSIUS=false
    export TTC_CONSUMER_KEY='XvwwSk7xAQdTot0DBWZnptT9V'
    export TTC_CONSUMER_SECRET='4EELKBAHG5jTfUT6fmXcKN52NuffPkNEfzcktP79NHtImn0uR3'
    export TTC_ACCESS_TOKEN='26911148-eiGVcbD3l59dMFMTxyrGiXx75TQlvQ1ddMSsRBOAn'
    export TTC_ACCESS_TOKEN_SECRET='slqfyOlse2sRrZuOWu76XtzFdxyDx0GeAUY7w9XPPdHCH'
    export TTC_SAY_BOX=bird
    export TTC_BOTS='tinycarebot,KHDMDCM,Puget_Houston'

    export PATH="/usr/local/opt/python/libexec/bin:$HOME/bin:/usr/local/bin:$HOME/.rbenv/bin:$HOME/.cask/bin:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$PATH"
    fpath=(/usr/local/share/zsh-completions $fpath)

    # RBENV
    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

    function jsonpp () { cat "$@" | python -mjson.tool | pygmentize -l json  }

    function build_project {
      xcbuild |xcpretty 
    }

    # Google Cloud SDK
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

    # Alias
    [ -d "$HOMEBREW_HOME/opt/macvim/MacVim.app" ] && alias v="vimer -t"
    [ -d "$HOME/Applications/Atom.app" ] && alias a=atom
    [ -f "$HOMEBREW_HOME/bin/hub" ] && alias git=hub
    [ -f "$HOMEBREW_HOME/bin/emacs" ] && alias e='open /Applications/Emacs.app $1'

    export EDITOR="mvim -f"
  ;;
# Linux specific
  Linux)
    plugins=(debian)
  ;;
  CYGWIN*|MINGW32*|MSYS*)
    echo 'MS Windows'
  ;;
  *) 
    echo 'other OS' 
  ;;
 esac
