# Hyprland
alias snip="grim -g \"$(slurp)\" ~/Pictures/snip_$(date +%F_%T).png && wl-copy < ~/Pictures/snip_$(date +%F_%T).png"


# List Directory
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree


# General Git Aliases
alias gst='git status'
alias gau='git add -u'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gck='git checkout'
alias gckb='git checkout -b'
alias gl='git log --oneline --graph --decorate --all'
alias glg='git log --graph --oneline --decorate'
alias gcl='git clone'
alias gd='git diff'
alias gds='git diff --staged'
alias gls='git ls-files'
alias gt='git tag'
alias gr='git reset'
alias grh='git reset --hard'
alias gpl='git pull'
alias gpf='git push --force'
alias gps='git push'
alias gpt='git push --tags'
alias gbr='git branch'
alias gbrd='git branch -d'
alias gbs='git branch -a'
alias gup='git fetch --all && git pull --rebase'
alias gclean='git clean -fdx'

# GitHub Aliases
alias ghp='git push origin $(git branch --show-current)'
alias ghpr='git pull origin $(git branch --show-current)'
alias ghcl='gh repo clone'
alias ghu='gh repo view --web'

# Python
alias autopepfix 'autopep8 --in-place --aggressive --aggressive --recursive'


# System Aliases
# alias ll='ls -lah'
# alias la='ls -A'
# alias l='ls -CF'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias df='df -h'
alias du='du -sh'
alias free='free -h'
alias grep='grep --color=auto'
alias vi='vim'
alias e='exit'
alias reload='source ~/.config/fish/config.fish'
alias update='sudo pacman -Syu'
alias upgrade='sudo pacman -Syu && sudo pacman -Qdtq | sudo pacman -Rns -'
alias install='sudo pacman -S'
alias remove='sudo pacman -R'
alias search='pacman -Ss'
alias clean='sudo pacman -Rns $(pacman -Qdtq)'


# System Monitoring
alias powerlogcat='cat ~/power_logs/power_log_(date +\%Y-\%m-\%d_\%H-\%M-\%S).txt'
alias powerlogless='less ~/power_logs/power_log_(date +\%Y-\%m-\%d_\%H-\%M-\%S).txt'
