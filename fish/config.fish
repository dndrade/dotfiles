if status is-interactive
    starship init fish | source
end

fastfetch

# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkd 'mkdir -p'

# Go path
# set -x GOROOT /usr/lib/go

# Latex path
# set -Ux PATH /usr/local/texlive/2023/bin/x86_64-linux $PATH

# pyenv
# pyenv init - | source
# status --is-interactive; and pyenv virtualenv-init - | source

# ssh-agent
# ssh_agent_init