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
