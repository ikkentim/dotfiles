export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster"
plugins=(git git-flow gh doctl tmux)

ZSH_TMUX_AUTOSTART=true

export DOTNET_ROOT=/usr/local/share/dotnet
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

# export LANG=en_US.UTF-8
export EDITOR='vim'
alias zshrc="vi ~/.zshrc"

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
