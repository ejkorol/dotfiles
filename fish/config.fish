set -gx EDITOR nvim
set -gx VISUAL nvim

if status is-interactive
    fastfetch

    set -gx PATH ~/.local/bin $PATH

    # zoxide
    zoxide init fish | source

    #nvm
    nvm use 24.14 --silent
end

function fish_prompt
    set_color cyan
    echo -n (whoami)

    set_color blue
    echo -n (prompt_pwd)

    set_color green
    echo -n ッ
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
