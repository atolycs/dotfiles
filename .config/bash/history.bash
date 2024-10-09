shopt -u histappend

share_history() {
  history -a
  history -c
  history -r
}

PROMPT_COMMAND='share_history'
