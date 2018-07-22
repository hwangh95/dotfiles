# zsh setop configuration
setopt append_history           # Dont overwrite history
setopt always_to_end            # When completing from the middle of a word, move the cursor to the end of the word
setopt extended_history         # Also record time and duration of commands.
setopt share_history            # Share history between multiple shells
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Dont display duplicates during searches.
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_ignore_all_dups     # Remember only one unique copy of the command.
setopt hist_reduce_blanks       # Remove superfluous blanks.
setopt hist_save_no_dups        # Omit older commands in favor of newer ones.
setopt pushd_ignore_dups        # Dont push copies of the same dir on stack.
setopt extended_glob            # Activate complex pattern globbing

unsetopt beep                   # No bell on error
unsetopt bg_nice                # No lower priority for background jobs
unsetopt hist_beep              # No bell on error in history
