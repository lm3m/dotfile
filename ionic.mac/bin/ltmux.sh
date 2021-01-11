#!/bin/bash

tmux new-session \; \
  split-window -v \; \
  split-window -h \; \
  select-pane -t 0 \; \
  send-keys 'ngrok http 7000' C-m \; \
  split-window -h \; \
  select-pane -t 2 \; \
  send-keys 'cd ~/code/dashboard && BROWSER=none IONIC_API_ROOT=http://localhost:7000 npm run start' C-m \; \
  select-pane -t 3 \; \
  send-keys 'ldock_start.sh' C-m \; \
  select-pane -t 1 \; \
  send-keys 'cd ~/ionic-runners && docker build --cache-from ghcr.io/ionic-team/appflow-runners/linux:base -t ghcr.io/ionic-team/appflow-runners/linux:base -f docker/linux-base/Dockerfile .; docker build -t ghcr.io/ionic-team/appflow-runners/linux:2020.11 -f docker/linux-2020.11/Dockerfile .; gitlab-runner run' C-m \; \


