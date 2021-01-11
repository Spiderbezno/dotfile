function cdd() {
  cd "$(ls -d -- */ | fzf)" || echo "Invalid directory"
}

function j() {
  fname=$(declare -f -F _z)

  [ -n "$fname" ] || source "$DOTLY_PATH/modules/z/z.sh"

  _z "$1"
}

function recent_dirs() {
  # This script depends on pushd. It works better with autopush enabled in ZSH
  escaped_home=$(echo $HOME | sed 's/\//\\\//g')
  selected=$(dirs -p | sort -u | fzf)

  cd "$(echo "$selected" | sed "s/\~/$escaped_home/")" || echo "Invalid directory"
}

reverse-search() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail HIST_FIND_NO_DUPS 2> /dev/null

  selected=( $(fc -rl 1 |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" fzf) )
  local ret=$?
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle redisplay
  typeset -f zle-line-init >/dev/null && zle zle-line-init
  return $ret
}

function mysql_general_log {
  MYSQL_LOG_PATH = "/var/log/mysql_general.log"

  sudo rm $MYSQL_LOG_PATH
  sudo touch $MYSQL_LOG_PATH
  sudo chmod 777 $MYSQL_LOG_PATH

  mkdir -p /usr/local/etc/my.cnf.d
  mysql -uroot -e "SET GLOBAL general_log = 'ON';"
  mysql -uroot -e "SET GLOBAL general_log_file = '$MYSQL_LOG_PATH';"

  tail -f $MYSQL_LOG_PATH
}
