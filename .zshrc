# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/devops/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    cp
    colorize
    thefuck
    k
	zsh-vim-mode
	dotbare
	fzf-tab
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
export JAVA_HOME=$(update-alternatives --query javac | sed -n -e 's/Best: *\(.*\)\/bin\/javac/\1/p')
export ANDROID_HOME="/home/devops/Android/Sdk/"
export PATH="${PATH}:${ANDROID_HOME}tools/:${ANDROID_HOME}platform-tools/"

#alias avdm='/home/devops/Android/Sdk/tools/bin/avdmanager'
#alias emulator='/home/devops/Android/Sdk/tools/emulator'

###-tns-completion-start-###
if [ -f /home/devops/.tnsrc ]; then 
    source /home/devops/.tnsrc 
fi
###-tns-completion-end-###
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH="$PATH:$HOME/.local/bin"

export VISUAL=nvim
export EDITOR="$VISUAL"
export BAT_THEME="Dracula"

alias tmux="tmux -u"
alias vim="nvim"
alias music="mpd && ncmpcpp -q"
alias b="~/.brightnes.sh"
alias wget="wget -q --show-progress --progress=bar:force:noscroll"
alias ts-node="ts-node --project ~/.tsconfig.json"
alias open="xdg-open"
alias ls='lsd'
alias vis="vim -u ~/.novimrc"
#export FZF_DEFAULT_OPTS='
#  --color=fg:#f8f8f2,bg:#282a36,fg+:#282a36,bg+:#bd93f9,info:#ff79c6,hl:#50fa7b
#  --color=hl+:#44475a,prompt:#6272a4,pointer:#282a36
#  --color=marker:#ffb86c,border:#bd93f9,header:#50fa7b,preview-bg:#282a36
#'

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:#bd93f9,bg+:-1,hl+:#ffaf5f,border:#bd93f9
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_CTRL_T_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --theme=ansi-dark --color=always --style=full --line-range :300 {}'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

source ~/.fonts/*.sh

MODE_INDICATOR_VIINS='%F{15}%F{8}INSERT%f'
MODE_INDICATOR_VICMD='%F{10}%F{2}NORMAL%f'
MODE_INDICATOR_REPLACE='%F{9}%F{1}REPLACE%f'
MODE_INDICATOR_SEARCH='%F{13}%F{5}SEARCH%f'
MODE_INDICATOR_VISUAL='%F{12}%F{4}VISUAL%f'
MODE_INDICATOR_VLINE='%F{12}%F{4}V-LINE%f'

MODE_CURSOR_VICMD="#50fa7b block"
MODE_CURSOR_VIINS="#bd93f9 blinking bar"
MODE_CURSOR_SEARCH="##ff5555 steady underline"

setopt PROMPT_SUBST
# Note the single quotes
RPS1='${MODE_INDICATOR_PROMPT}' 
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

export DOTBARE_DIR="$HOME/.dotfiles.git"
export DOTBARE_TREE="$HOME"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ ! -f $HOME/.oh-my-zsh/custom/plugins/forgit/forgit.plugin.zsh ]] || source $HOME/.oh-my-zsh/custom/plugins/forgit/forgit.plugin.zsh
# Provides an fzf menu to search through apt packages
function searchPackage(){
  apt list 2>/dev/null | cut -d'/' -f 1 |awk "{print \$1}" |  fzf -m --preview 'bat <(apt list 2>/dev/null | cut -d'/' -f 1 |awk "{print \$1}"| apt show {1} 2>/dev/null)' | xargs -ro sudo apt install; zle reset-prompt; zle redisplay
}


# Provides an fzf menu to find installed packages (apt only)
function installedPackage(){
  apt list --installed 2>/dev/null | cut -d'/' -f 1 |awk "{print \$1}" |  fzf -m --preview 'bat <(apt list 2>/dev/null | cut -d'/' -f 1 |awk "{print \$1}"| apt show {1} 2>/dev/null)' | xargs -ro sudo apt autoremove; zle reset-prompt; zle redisplay
}

zle -N searchPackage
zle -N installedPackage
bindkey '^xp' searchPackage
bindkey '^xi' installedPackage


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

PATH="/home/devops/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/devops/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/devops/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/devops/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/devops/perl5"; export PERL_MM_OPT;


eval "$(starship init zsh)"
