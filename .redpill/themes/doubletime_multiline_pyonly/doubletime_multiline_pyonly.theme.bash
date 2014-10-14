#!/usr/bin/env bash

source "$REDPILL/themes/doubletime/doubletime.theme.bash"

prompt_setter()
{
  # Save history
  history -a
  history -c
  history -r

  if [[ -z "$THEME_PROMPT_CLOCK_FORMAT" ]]; then
    clock="\t"
  else
    clock=$THEME_PROMPT_CLOCK_FORMAT
  fi

  PS1="
$clock $(scm_char) [$THEME_PROMPT_HOST_COLOR\u@${THEME_PROMPT_HOST}$reset_color] $(virtualenv_prompt)
\w
$(doubletime_scm_prompt)$reset_color $ "
  PS2='> '
  PS4='+ '
}

PROMPT_COMMAND=prompt_setter
