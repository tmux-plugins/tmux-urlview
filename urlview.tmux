#!/usr/bin/env bash
tmux bind-key b capture-pane \\\; \
  save-buffer /tmp/tmux-buffer \\\; \
  split-window -l 10 "urlview /tmp/tmux-buffer"
