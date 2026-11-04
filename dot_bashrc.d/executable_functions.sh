fpass() {
    local prefix="${PASSAGE_DIR:-$HOME/.passage/store}"

    local name
    name=$(
        find "$prefix" -type f -name '*.age' |
        sed -e "s|$prefix/||" -e 's|\.age$||' |
        fzf --height 40% \
            --reverse \
            --no-multi \
            --prompt="passage> "
    ) || return

    passage "$@" "$name"
}
