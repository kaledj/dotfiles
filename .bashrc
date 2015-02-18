# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias sl='ls --color=auto'
alias l='ls --color=auto'
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias lal='ls -al --color=auto'

export LD_LIBRARY_PATH=~/lib tmux
export PATH=.:~/bin:$PATH

# Set up prompt
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi
if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[31m\]\u\[\033[00m\]@\h\w\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

if [ "$TERM" = "rxvt-unicode-256color" ]; then
    export HAS_256_COLORS=yes
    export TERM=xterm-256color
fi

export TERM=xterm-256color
