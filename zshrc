# -------------------------------
#             Exports
# -------------------------------

# Locales
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Miscellaneous
export DISPLAY=:0
export ENHANCD_FILTER=fzy

# -------------------------------
#             Plugins
# -------------------------------

# Zplug Initialization 
[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Searching
#zplug "aperezdc/zsh-fzy"

# Bookmarks
zplug "jocelynmallon/zshmarks"

# Enhanced dir list
zplug "supercrabtree/k"

# Enhanced cd and jumping back
zplug "b4b4r07/enhancd", use:init.sh, defer:2

# Simple zsh calculator
zplug "arzzen/calc.plugin.zsh"

# Load theme and directory colors
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "seebi/dircolors-solarized", ignore:"*", as:plugin

# Load from oh-my-zsh
## Useful commands/enhancements
zplug "plugins/common-aliases",    from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "plugins/colored-man-pages", from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "plugins/command-not-found", from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "plugins/copydir",           from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "plugins/copyfile",          from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "plugins/cp",                from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "plugins/encode64",          from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "plugins/extract",           from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "plugins/vi-mode",           from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "plugins/tmux",              from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "plugins/urltools",          from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "plugins/fancy-ctrl-z",      from:oh-my-zsh, ignore:oh-my-zsh.sh

## Install oh-my-zsh plugins if the tools are installed
zplug "plugins/git",               from:oh-my-zsh, if:"(( $+commands[git] ))", ignore:oh-my-zsh.sh
zplug "plugins/cargo",             from:oh-my-zsh, if:"(( $+commands[cargo] ))", ignore:oh-my-zsh.sh
zplug "plugins/golang",            from:oh-my-zsh, if:"(( $+commands[go] ))", ignore:oh-my-zsh.sh
zplug "plugins/svn",               from:oh-my-zsh, if:"(( $+commands[svn] ))", ignore:oh-my-zsh.sh
zplug "plugins/node",              from:oh-my-zsh, if:"(( $+commands[node] ))", ignore:oh-my-zsh.sh
zplug "plugins/npm",               from:oh-my-zsh, if:"(( $+commands[npm] ))", ignore:oh-my-zsh.sh
zplug "plugins/bundler",           from:oh-my-zsh, if:"(( $+commands[bundler] ))", ignore:oh-my-zsh.sh
zplug "plugins/gem",               from:oh-my-zsh, if:"(( $+commands[gem] ))", ignore:oh-my-zsh.sh
zplug "plugins/rbenv",             from:oh-my-zsh, if:"(( $+commands[rbenv] ))", ignore:oh-my-zsh.sh
zplug "plugins/rvm",               from:oh-my-zsh, if:"(( $+commands[rvm] ))", ignore:oh-my-zsh.sh
zplug "plugins/pip",               from:oh-my-zsh, if:"(( $+commands[pip] ))", ignore:oh-my-zsh.sh
zplug "plugins/sudo",              from:oh-my-zsh, if:"(( $+commands[sudo] ))", ignore:oh-my-zsh.sh
zplug "plugins/gpg-agent",         from:oh-my-zsh, if:"(( $+commands[gpg-agent] ))", ignore:oh-my-zsh.sh
zplug "plugins/systemd",           from:oh-my-zsh, if:"(( $+commands[systemctl] ))", ignore:oh-my-zsh.sh
zplug "plugins/docker",            from:oh-my-zsh, if:"(( $+commands[docker] ))", ignore:oh-my-zsh.sh
zplug "plugins/docker-compose",    from:oh-my-zsh, if:"(( $+commands[docker-compose] ))", ignore:oh-my-zsh.sh

# zsh tools
zplug "djui/alias-tips"
zplug "hlissner/zsh-autopair", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:3

# -------------------------------
#             Options
# -------------------------------
# less configuration
export LESS="--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS"

# zsh QoL fixes
KEYTIMEOUT=1
WORDCHARS='*?_-[]~=./&;!#$%^(){}<>'

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE

# zsh setop configuration
setopt append_history           # Dont overwrite history
setopt extended_history         # Also record time and duration of commands.
setopt share_history            # Share history between multiple shells
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Dont display duplicates during searches.
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_ignore_all_dups     # Remember only one unique copy of the command.
setopt hist_reduce_blanks       # Remove superfluous blanks.
setopt hist_save_no_dups        # Omit older commands in favor of newer ones.
setopt pushd_ignore_dups        # Dont push copies of the same dir on stack.
setopt extended_glob

# -------------------------------
#             Aliases
# -------------------------------

# Set editor preference to nvim if available.
if (( $+commands[nvim] )); then
	alias vim='() { $(whence -p nvim) $@ }'
else
	alias vim='() { $(whence -p vim) $@ }'
fi

# Colored ls
alias ls="ls --color=auto"

# Colored grep
alias grep='() { $(whence -p grep) --color=auto $@ }'
alias egrep='() { $(whence -p egrep) --color=auto $@ }'

# CD to Windows home directory
alias winhome="cd /mnt/c/Users/Willy/"
# -------------------------------
#          Key Bindings
# -------------------------------

# -------------------------------
#           Completions
# -------------------------------

zstyle ':completion:*' add-space true
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd directory
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+r:|[._-]=* r:|=*'
zstyle ':completion:*' match-original only
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt 'Num of Errors %e'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 0

# -------------------------------
#             Startup
# -------------------------------

# Install missing plugins
if ! zplug check; then
    printf "Install plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Check the terminal emulator
sid=$(($(ps -o sid= -p "$$")))
sparent=$(($(ps -o ppid= -p "$sid")))
emulator=$(ps -o comm= -p "$sparent")

case $emulator in
# Regular setup
*gnome-terminal*)
    simplified=0;;;
# VScode
*init*)
    simplified=1;;;
esac

if zplug check "seebi/dircolors-solarized"; then
    eval $(dircolors ~/.zplug/repos/seebi/dircolors-solarized/dircolors.256dark)
fi

if zplug check "zsh-users/zsh-history-substring-search"; then
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down
fi

# -------------------------------
#              Themes
# -------------------------------
# https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# Regular usage
if zplug check "bhilburn/powerlevel9k" && [[ $simplified == 0 ]]; then
    # Easily switch primary foreground/background colors
    DEFAULT_FOREGROUND=006 DEFAULT_BACKGROUND=235
    DEFAULT_COLOR=$DEFAULT_FOREGROUND

    # powerlevel9k prompt theme
    DEFAULT_USER=$USER

    POWERLEVEL9K_MODE="nerdfont-complete"
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
    #POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

    POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true

    POWERLEVEL9K_CONTEXT_TEMPLATE="\uF109 %m"

    POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="$DEFAULT_BACKGROUND"

    POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\uE0B4"
    POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR="%F{$(( $DEFAULT_BACKGROUND - 2 ))}|%f"
    POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR="\uE0B6"
    POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR="%F{$(( $DEFAULT_BACKGROUND - 2 ))}|%f"

    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

    POWERLEVEL9K_STATUS_VERBOSE=true
    POWERLEVEL9K_STATUS_CROSS=true
    POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

    POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{cyan}\u256D\u2500%f"
    POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f  "

    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir_writable dir vcs)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time background_jobs status vi_mode time ssh)

    POWERLEVEL9K_VCS_CLEAN_BACKGROUND="green"
    POWERLEVEL9K_VCS_CLEAN_FOREGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="yellow"
    POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="magenta"
    POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="$DEFAULT_BACKGROUND"

    POWERLEVEL9K_DIR_HOME_BACKGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_DIR_HOME_FOREGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="$DEFAULT_BACKGROUND"

    POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
    POWERLEVEL9K_STATUS_OK_BACKGROUND="$(( $DEFAULT_BACKGROUND + 2 ))"

    POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
    POWERLEVEL9K_STATUS_ERROR_BACKGROUND="$(( $DEFAULT_BACKGROUND + 2 ))"

    POWERLEVEL9K_HISTORY_FOREGROUND="$DEFAULT_FOREGROUND"

    POWERLEVEL9K_TIME_FORMAT="%D{%T \uF017}" #  15:29:33
    POWERLEVEL9K_TIME_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_TIME_BACKGROUND="$DEFAULT_BACKGROUND"

    POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_EXECUTION_TIME_ICON="\u23F1"

    POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="$DEFAULT_FOREGROUND"

    POWERLEVEL9K_USER_ICON="\uF415" # 㹈
    POWERLEVEL9K_USER_DEFAULT_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_USER_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_USER_ROOT_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_USER_ROOT_BACKGROUND="$DEFAULT_BACKGROUND"

    POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="magenta"
    POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="$(( $DEFAULT_BACKGROUND + 2 ))"
    POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="$(( $DEFAULT_BACKGROUND - 2 ))"
    POWERLEVEL9K_ROOT_ICON=$'\uF198'  # 

    POWERLEVEL9K_SSH_FOREGROUND="yellow"
    POWERLEVEL9K_SSH_BACKGROUND="$(( $DEFAULT_BACKGROUND + 2 ))"
    POWERLEVEL9K_SSH_BACKGROUND="$(( $DEFAULT_BACKGROUND - 2 ))"
    POWERLEVEL9K_SSH_ICON="\uF489"  # 㿺

    POWERLEVEL9K_HOST_LOCAL_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_HOST_LOCAL_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_HOST_REMOTE_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_HOST_REMOTE_BACKGROUND="$DEFAULT_BACKGROUND"

    POWERLEVEL9K_HOST_ICON_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_HOST_ICON_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_HOST_ICON="\uF109" # 

    POWERLEVEL9K_OS_ICON_FOREGROUND="$DEFAULT_FOREGROUND"
    POWERLEVEL9K_OS_ICON_BACKGROUND="$DEFAULT_BACKGROUND"

    POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_LOAD_WARNING_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
    POWERLEVEL9K_LOAD_WARNING_FOREGROUND="yellow"
    POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="green"
    POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
    POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
    POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"

    POWERLEVEL9K_BATTERY_LEVEL_BACKGROUND_COLOR="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="$DEFAULT_BACKGROUND"
    POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND="$DEFAULT_BACKGROUND"
# Simplified version for VScode
elif zplug check "bhilburn/powerlevel9k" && [[ $simplified == 1 ]]; then
    DEFAULT_USER=$USER

    POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir_writable dir vcs)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time background_jobs status vi_mode time ssh)
fi

zplug load

[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"

# Source functions exports and aliases.
[[ -f ~/.zsh_functions ]] && source ~/.zsh_functions
[[ -f ~/.zsh_exports ]] && source ~/.zsh_exports
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases
## Edited from the dotfiles of @tonylambiris
