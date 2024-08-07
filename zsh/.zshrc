eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey '^K' kill-line

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Alias
alias ls='eza -al --color=always --group-directories-first'
alias la='eza -a --color=always --group-directories-first'
alias ll='eza -l --color=always --group-directories-first'
alias lt='eza -aT --color=always --group-directories-first'
alias l.='eza -als mod --color=always --group-directories-first -I .git'
alias ld='eza -ls mod --group-directories-first --color=always'
alias lda='eza -als mod --group-directories-first --color=always'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ss='grim -g "$(slurp)"'
alias s='swappy -f'
alias wf='wf-recorder -g "$(slurp)"'
alias k='kubectl'
alias c='curlie'
alias t='transmission-cli'

alias lzg='lazygit'
alias lzd='lazydocker'

alias cat='bat'

alias screenoff='xrandr --output eDP-1 --off'

alias pn="pnpm"
alias px="pnpx"

# Rust
alias cwr="cargo watch -q -c -x 'run -q'"

yt() {
	yt-dlp -o - "$1" | mpv -
}

ytl() {
	while IFS= read -r line; do
		yt "$line"
	done <"./videos.txt"
}

# Docker
alias dclear='docker system prune -af --volumes'
alias dls='docker container ls -a'
alias dils='docker image ls -a'
alias dcup='docker compose up -d'
alias dcdown='docker compose down'
alias dclogs='docker compose logs -f'

# Funcs

v() {
	if [ $# -eq 0 ]; then
		local file
		file=$(rg --files | fzf)
		if [ $? -eq 0 ]; then
			nvim "$file"
		fi
	else
		nvim "$@"
	fi
}

vr() {
	local selection
	selection=$(rg --line-number . | fzf --delimiter ':' --preview 'bat --color=always --highlight-line {2} {1}' | awk -F ':' '{print "+"$2, $1}')

	if [ -n "$selection" ]; then
		local linecmd=$(echo $selection | cut -d' ' -f1)
		local filename=$(echo $selection | cut -d' ' -f2-)
		nvim "$linecmd" "$filename"
	fi
}

take() {
	mkdir -p "$1"
	cd "$1"
}

note() {
	echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" >>"$HOME/scripts/notes.md"
	echo "$@" >>"$HOME/scripts/notes.md"
}

notes() {
	gum pager <"$HOME/scripts/notes.md"
}

lfcd() {
	tmp="$(mktemp)"
	lf -last-dir-path="$tmp" "$@"
	#./lfrun
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		if [ -d "$dir" ]; then
			if [ "$dir" != "$(pwd)" ]; then
				cd "$dir"
			fi
		fi
	fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export LC_ALL=en_US.UTF-8

# Turso
export PATH="/home/carraes/.turso:$PATH"

autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# pnpm
export PNPM_HOME="/home/carraes/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
