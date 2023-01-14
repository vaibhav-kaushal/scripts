#!/usr/bin/env zsh

[[ -v ZSH_SESSION_INIT_FILE ]] && source "$ZSH_SESSION_INIT_FILE"

if command -v rbenv > /dev/null; then
	eval "$(rbenv init -)"
fi
