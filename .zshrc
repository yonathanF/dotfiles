# If you come from bash you might have to change your $PATH.
export PATH=~/.local/bin:~/Scripts:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=/home/yonathan//.oh-my-zsh
export EDITOR=nvim
export TERM="xterm-256color"
export DISABLE_AUTO_TITLE='true'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME=minimal
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_DISABLE_RPROMPT=true
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv dir vcs)
#POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git vi-mode
  python
  zsh-autosuggestions
  zsh-syntax-highlighting
  pip
  virtualenv
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
##### custom ###########

# aliases 
alias cc="xclip -selection c"
alias cv="xclip -selection c -o"
alias ls='ls -h --color=auto'
alias sl=ls
alias startPrinter='systemctl start org.cups.cupsd.service'
alias sf='cd /home/yonathan/Documents/school/sem8/'
alias act='source env/bin/activate'
alias zt=zathura
alias t=tree -d
alias v=nvim
alias vim=nvim
alias ww='vim /home/yonathan/Sync/wiki/index.md'
alias info=archey3       
alias cd='pushd > /dev/null 2>&1'
alias cb='popd > /dev/null 2>&1'
alias zshc='vim ~/.zshrc'
alias grep='ag'
alias ack='ag'
alias cat=bat
alias bb='zt $((find ~/Documents/Books && find ~/Documents/Articles) | rofi -dmenu) --fork'
alias td="nvim ~/Sync/wiki/Tasks.md"
alias wth="curl wttr.in"
alias bsp="vim ~/.config/bspwm/bspwmrc"
alias sxrc="vim ~/.config/sxhkd/sxhkdrc"
alias rm=trash-put

eval $(keychain --eval --quiet id_rsa)

# bindings
bindkey -M viins 'jk' vi-cmd-mode

autoload -Uz compinit
compinit


#source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /etc/profile.d/autojump.zsh
source /usr/share/zsh/plugins/alias-tips/alias-tips.plugin.zsh
#(/bin/cat ~/.cache/wal/sequences &)

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
bindkey -s '^o' 'v $(fzf)^M'
bindkey -s '^n' 'zt $(fzf) --fork^M'

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPS="--extended"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# opam configuration
test -r /home/yonathan/.opam/opam-init/init.zsh && . /home/yonathan/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
