eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export FZF_DEFAULT_OPTS="--height 41% --layout=reverse --border --preview-window=right:60% --preview 'bat --color=always --style=numbers --line-range :400 {}' --bind ctrl-y:preview-up,ctrl-e:preview-down,ctrl-b:preview-page-up,ctrl-f:preview-page-down"
export FZF_DEFAULT_COMMAND="fd --type f"

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

alias lzg='lazygit'
alias lzd='lazydocker'

alias cat='bat'

alias pm="pnpm"
alias px="pnpx"

alias purl='curl -X POST'

# Docker
alias dclear='docker system prune -af'
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
