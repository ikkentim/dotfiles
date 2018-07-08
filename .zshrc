export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster"
plugins=(git, git-flow tmux)

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/.composer/vendor/bin:/usr/local/bin/"

# Just some mac things.
if [[ `uname` == 'Darwin' ]]
then
    export PATH="$PATH:/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/"
    export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    export DEFAULT_USER=`whoami`
    export ZSH_TMUX_AUTOSTART="true"
fi

source $ZSH/oh-my-zsh.sh

# export LANG=en_US.UTF-8
export EDITOR='vim'
alias zshrc="vi ~/.zshrc"
alias rmds="find . -type f -name '*.DS_Store' -ls -delete" # From when my Mac was messing with me
alias hack='git add . && git commit -m "$(curl -sS https://whatthecommit.com/index.txt)" && git pull && git push' # For hackathons, so fuck it
alias vi="vim" # FU vi!

#dec2hex [dec-num]
dec2hex()
{
  echo "obase=16; $1" | bc
}

#hex2dec [hex-num]
hex2dec()
{
  echo "ibase=16; $1" | bc
}

#convertsize [filename] [square-size-in-px]
convertsize()
{
  convert "$1" -resize "$2x$2" "$2.png"
}

#gencircle [diameter-in-px] [color] [out-filename]
gencircle()
{
    convert -size $(($1 * 2 + 1))x$(($1 * 2 + 1)) xc:transparent -fill $2 -draw "circle $1,$1 $1,0" $3
}

cleaner()
{
    stty sane; printf '\033k%s\033\\\033]2;%s\007' "`basename "$SHELL"`" "`uname -n`"; tput reset; tmux refresh
}
