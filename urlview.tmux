#!/usr/bin/env bash

get_tmux_option() {
  local option=$1
  local default_value=$2
  local option_value=$(tmux show-option -gqv "$option")
  if [ -z "$option_value" ]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}

find_executable() {
  local extractor="$(get_tmux_option "@urlview-extractor")"
  if type "${extractor%% *}" >/dev/null 2>&1; then
    # FIXME: The %% idiom should work in sh, but it wasn't for me, so I
    #        reverted the interpreter to bash
    echo "$extractor"
    return
  fi
  tmux display-message "tmux-urlview: #{@urlview-extractor} not found"
  if type urlview >/dev/null 2>&1; then
    echo "urlview"
    return
  fi
  tmux display-message "tmux-urlview: urlview not found"
  if type extract_url >/dev/null 2>&1; then
    echo "extract_url"
    return
  fi
  tmux display-message "tmux-urlview: extract_url not found"
}

readonly key="$(get_tmux_option "@urlview-key" "u")"
readonly cmd="$(find_executable)"
readonly temp_file="$(mktemp --tmpdir tmux-urlview.XXX)"

if [ -z "$cmd" ]; then
  tmux display-message "Failed to load tmux-urlview: No extractor programs found"
else
  tmux bind-key "$key" capture-pane -J \\\; \
    save-buffer "$temp_file" \\\; \
    delete-buffer \\\; \
    split-window -l 10 "$cmd '$temp_file'; rm '$temp_file' "
fi
