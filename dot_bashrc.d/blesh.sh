# ============================================================
# ble.sh configuration
# ============================================================

# ============================================================
# Common settings
# ============================================================

ble-face command_builtin='fg=yellow'
ble-face command_alias='fg=122 bg=black'
ble-face command_function='fg=yellow'
ble-face command_file='fg=yellow'
ble-face command_keyword='fg=yellow'
ble-face command_jobs='fg=yellow'

ble-face auto_complete='fg=246'
ble-face -s menu_complete_match fg=015,bg=126
ble-face region_insert='fg=27'
PS1='\A | \w \$ \n'

# ============================================================
# SSH / Phone settings
# ============================================================

#if [[ -n "$SSH_CONNECTION" ]]; then
    PROMPT_DIRTRIM=2

    LS_COLORS="${LS_COLORS}:di=1;96"
    export LS_COLORS

    ble-face filename_directory='fg=51'
    ble-face syntax_command='fg=yellow'
    ble-face syntax_error='fg=196'
    ble-face menu_complete_selected='fg=16,bg=153'
    ble-face menu_filter_input='fg=16,bg=229'
#fi
