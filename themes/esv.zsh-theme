# Remove space after RPROMPT
ZLE_RPROMPT_INDENT=0

caret() {
	if [ $UID -eq 0 ];
	then echo "%{$FG[196]%}#%{$reset_color%}";
	else echo "%{$FG[159]%}\$%{$reset_color%}";
	fi;
}

directory() {
	echo "%{$FG[015]%}%(!.%1~.%~)%{$reset_color%}";
}

vi_indicator() {
	echo "${${KEYMAP/vicmd/"%{$FG[009]%}*%{$reset_color%}"}/(main|viins)/"%{$FG[014]%}+%{$reset_color%}"}";
}

# Thanks to:
# https://zenbro.github.io/2015/07/23/show-exit-code-of-last-command-in-zsh
exit_code() {
	echo "%(?..%{$fg[red]%}-%{$reset_color%}%{$fg_bold[red]%}$?%{$reset_color%}%{$fg[red]%}-%{$reset_color%})"
}

weather() {
	echo "$(wttr '?format=1' -s)";
}

ses() {
	echo "%{$FG[015]%}%n@%m%{$reset_color%}";
}

# autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=195"

# git_prompt_info
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT="$(ses) $(directory) $(caret) "
function zle-line-init zle-keymap-select {
	RPROMPT="$(exit_code) $(git_prompt_info) $(vi_indicator)"
	zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

