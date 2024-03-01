#!/usr/bin/env bash
. /usr/local/etc/profile.d/z.sh

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(_z 2>&1 | cut -d ' ' -f2- | awk '{$1=$1;print}' | fzf --tac --no-sort)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    echo "$selected session doesn't exist"
    tmux new-session -ds $selected_name -c $selected
fi

if [[ -z $TMUX ]]; then
    tmux attach-session -t $selected_name
else
    tmux switch-client -t $selected_name
fi

