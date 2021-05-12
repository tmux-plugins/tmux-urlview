#!/usr/bin/env bash

get_tmux_option() {
  local option=$1
  local default_value=$2
  local option_value=$(tmux show-option -gqv "$option")
  if [ -z $option_value ]; then
    echo $default_value
  else
    echo $option_value
  fi
}

find_executable() {
  if type urlview >/dev/null 2>&1; then
    echo "urlview"
  elif type extract_url >/dev/null 2>&1; then
    echo "extract_url"
  fi
}

readonly key="$(get_tmux_option "@urlview-key" "u")"
readonly cmd="$(find_executable)"
readonly temp_file="$(mktemp --tmpdir tmux-urlview.XXX)"

if [ -z "$cmd" ]; then
  tmux display-message "Failed to load tmux-urlview: neither urlview nor extract_url were found on the PATH"
else
  tmux bind-key "$key" capture-pane -J \\\; \
    save-buffer "$temp_file" \\\; \
    delete-buffer \\\; \
    split-window -l 10 "$cmd '$temp_file'; rm '$temp_file' "
fi
