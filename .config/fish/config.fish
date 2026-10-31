# CachyOS Fish Config
if test -f /usr/share/cachyos-fish-config/cachyos-config.fish
    source /usr/share/cachyos-fish-config/cachyos-config.fish
end

# Rust / Cargo environment
if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
end

# PATH
fish_add_path -g "$HOME/.local/bin" "$HOME/.cargo/bin"

# Aliases: Modern replacements
if type -q eza
    alias ls="eza --icons --group-directories-first"
    alias ll="eza -lh --icons --group-directories-first --git"
    alias la="eza -lah --icons --group-directories-first --git"
    alias lt="eza --tree --level=2 --icons"
end

if type -q bat
    alias cat="bat --paging=never --style=plain"
    alias ccat="bat"
end

# Git shortcuts
alias gs="git status -sb"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"

# Starship Prompt
if type -q starship
    starship init fish | source
end

# Zoxide Smart CD
if type -q zoxide
    zoxide init fish | source
end

# Greeting
function fish_greeting
    fastfetch
end
