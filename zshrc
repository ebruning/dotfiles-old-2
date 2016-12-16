# General settings
ZSH=$HOME/.oh-my-zsh
TERM=xterm-256color
ZSH_THEME="dpoggi" 
source $ZSH/oh-my-zsh.sh
set -o vi
unsetopt correctall

case "$(uname -s)" in
# Mac specific
   Darwin)
    HOMEBREW_HOME=/usr/local
    plugins=(osx brew vagrant zsh-completions gem)
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

    export PATH="$HOME/bin:/usr/local/bin:$HOME/.rbenv/bin:$HOME/.cask/bin:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$PATH"
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
