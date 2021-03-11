export FLUTTER_HOME="/Users/jorgegomes/Development/Flutter2_SDK/flutter"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11-openj9.jdk/Contents/Home
export ANDROID_HOME=/Users/jorgegomes/Library/Android/sdk

export FZF_DEFAULT_OPTS='
  --color=pointer:#ebdbb2,bg+:#3c3836,fg:#ebdbb2,fg+:#fbf1c7,hl:#8ec07c,info:#928374,header:#fb4934
  --reverse
'

export HOMEBREW_AUTO_UPDATE_SECS=604800 # 1 week
export HOMEBREW_NO_ANALYTICS=true

export GPG_TTY=$(tty)

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export path=(
  "$HOME/bin"
  "$HOME/Library/PackageManager/bin"
  "$DOTLY_PATH/bin"
  "$DOTFILES_PATH/bin"
  "$JAVA_HOME/bin"
  "$FLUTTER_HOME/bin"
  "$FLUTTER_HOME/.pub-cache/bin"
  "$ANDROID_HOME/platform-tools"
  "$HOME/.cargo/bin"
  "/usr/local/opt/ruby/bin"
  "/usr/local/opt/python/libexec/bin"
  "/usr/local/bin"
  "/usr/local/sbin"
  "/bin"
  "/usr/bin"
  "/usr/sbin"
  "/sbin"
)
