#!/usr/bin/env bash

get_tmux_option()
{
    local option=$1
    local default_value=$2
    local option_value=$(tmux show-option -gqv "$option")

    if [ -z $option_value ];
    then
        echo $default_value
    else
        echo $option_value
    fi
}

readonly key="$(get_tmux_option "@urlview-key" "u")"
readonly rsh="$(get_tmux_option "@urlview-rsh" "no")"
readonly buf="$(get_tmux_option "@urlview-buf" "${TMPDIR:-/tmp}/tmux-buffer")"
readonly cmd="$(get_tmux_option "@urlview-cmd" "urlview")"

if [[ "$rsh" == "yes" ]];
then
    tmux bind-key "$key" capture-pane -J \\\; \
        save-buffer "$buf" \\\; \
        delete-buffer \\\; \
        run-shell -b "$cmd $buf"
else
    tmux bind-key "$key" capture-pane -J \\\; \
        save-buffer "$buf" \\\; \
        delete-buffer \\\; \
        if-shell '[ true ]' 'split-window -l 10'
fi
