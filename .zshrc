# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/matt/.oh-my-zsh/repos/robbyrussell/oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# The theme is blank because I do not want to use any of the
# included themes, and I would rather use "Pure"
ZSH_THEME="" #default is robbyrussel

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
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
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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

# Aliases
alias vmware="/usr/bin/vmplayer &"
alias spotify="spt"
alias zshcfg="vim ~/.zshrc"
alias zshrst="source ~/.zshrc"
alias omzsh="vim ~/.oh-my-zsh"
alias vimcfg="vim ~/.vimrc"
alias vimt="vim -c NERDTree"
alias mako="make once"
alias makco="make clean && make once" #this is one of my most common commands for making LaTeX, especially when I finish my work
alias fesr="firefox-esr"
alias makcofer="make clean && make once && firefox-esr *.pdf"
alias clean="make clean"
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-LATEX ALIASES=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# This alias will allow me to quickly make files with the basics I need for Latex
# This is designed to be like:
# $ DnDTeX > newFile.tex
alias DnDTeX="cat ~/Documents/.LaTeXPresets/mattdndbookpreset.tex"

# This alias is a quick way to get to my current projects
alias cddnd="cd ~/Documents/DesertCampaign"
alias cdclass="cd ~/Classwork/Junior"

#=====================================================================================
#-  -  -  -  -  -  -  -  -  -  -  -  PURE INSTALL  -  -  -  -  -  -  -  -  -  -  -  - 
#=====================================================================================
fpath+="$HOME/.zshthemes/pure"

autoload -U promptinit; promptinit
prompt pure

# AUTO RUNS

zsh ~/changedKeys #This Changes the eject disk key on an apple magic keyboard to a del key, as it should be

#sudo zsh /usr/local/bin/setFkeyFirst #This changes the fn key functionality to be what I want

# Adding to the path

export PATH="$HOME/bin:$PATH"



function setjdk() {
  if [ $# -ne 0 ]; then
    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
    if [ -n "${JAVA_HOME+x}" ]; then
      removeFromPath $JAVA_HOME
    fi
    export JAVA_HOME=`/usr/libexec/java_home -v $@`
    export PATH=$JAVA_HOME/bin:$PATH
  fi
}
