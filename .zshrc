if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then exec startx 
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="awesomepanda"
export EDITOR=nvim
export VISUAL=nvim
# ALIASES
#alias tr="trans -b :ru $argv"
alias tren="trans -b :en $argv"
alias tr="trans :ru $argv"
alias sai="sudo apt install -y $argv"
alias ra="ranger"
alias aptup="sudo apt update && sudo apt upgrade"
alias gal="sxiv "$(pwd)""
alias getpath="find -type f | fzf --multi | sed 's/^..//' | wl-copy"
alias plu="sudo brightnessctl s +20%"
alias mi="sudo brightnessctl s 20%-"
alias dox="libreoffice --headless --invisible --convert-to"
alias v="nvim"
alias ibx="nvim ~/Dropbox/Area/TheSecondBrain/ibx/`date +"%F_%H-%M-%S.md"`"
alias sps="sudo pacman -S"
alias syu="sudo pacman -Syu"
alias menu="./.config/rofi/applets/menu/powermenu.sh"
alias bip="sudo modprobe -r pcspkr"
alias sdi="sudo dnf install"
alias stud="~/Dropbox/stud/"
alias py='python3.11'
alias ipy='ipython3'
alias treee='exa --tree --level=2'
# FUNCTIONS
# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}
# man 
fman() {
    man -k . | fzf --prompt='Man> ' | awk '{print $1}' | xargs -r man
}
# remove file
function rm {
  if [[ "$#" -eq 0 ]]; then
    local files
    files=$(ls | fzf --multi)
    echo $files | xargs rm
  else
    command rm "$@"
  fi
}

cdf() {
	cd "$(find -type d | fzf)"
}

op() {
	xdg-open "$(find -type f | fzf --multi)"
}
# PLUGINS
plugins=(
	git
	composer	
	dotbare
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-z
	#fzf-zsh-plugin
)

source $ZSH/oh-my-zsh.sh

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# POMODORO
declare -A pomo_options
pomo_options["work"]="25"
pomo_options["break"]="5"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  timer ${pomo_options["$val"]}m
  spd-say "'$val' session done"
  fi
}

alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"
