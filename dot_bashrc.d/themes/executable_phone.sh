# SSH theme

# Prompt
PS1='\A | \w\W \$ '

# Shorten long paths
PROMPT_DIRTRIM=2

# Bright directory color
LS_COLORS="${LS_COLORS}:di=1;96"
export LS_COLORS

# ble.sh colors (if loaded)
if command -v ble-face >/dev/null 2>&1; then
    ble-face filename_directory='fg=51'
    ble-face syntax_command='fg=yellow'
    ble-face syntax_error='fg=196'
    ble-face menu_complete_selected='fg=16,bg=153'
    ble-face menu_filter_input='fg=16,bg=229'
fi
