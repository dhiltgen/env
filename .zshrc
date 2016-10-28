export HISTSIZE=10000
export HISTFILE="${HOME}/.history"
export SAVEHIST=$HISTSIZE

setopt inc_append_history
setopt share_history
setopt extended_history
setopt hist_ignore_dups

setopt prompt_subst

#export JAVA_HOME=/opt/j2sdk1.4.2_06
export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:${HOME}/bin:${HOME}/tools:/home/daniel/code/docker/machine/bin
bindkey -v

_gpgkey() {
    if [ -n "${GPG_AGENT_INFO}" ] ; then
        echo "⚿ "
    else
        echo ""
    fi
}
_machine() {
    if [ "${DOCKER_MACHINE_NAME}" != "" ] ; then
        echo "⚙${DOCKER_MACHINE_NAME}:"
    elif [ "${DOCKER_CERT_PATH}" != "" ] ; then
        echo "⚙`basename ${DOCKER_CERT_PATH}`:"
    elif [ "${DOCKER_HOST}" != "" ] ; then
        echo "⚙`echo ${DOCKER_HOST}| cut -f3 -d/ | cut -f1 -d:`:"
    fi
}
GIT_PS1_SHOWDIRTYSTATE=1
source ~/bin/git-prompt.sh


PS1='$(print "%{\e[1;94m%}")$(_machine)$(print "%{\e[1;32m%}%n@%m%{\e[0m%}"):${MACHINE_DRIVER}$(__git_ps1) %3~%b %# '
# PS1="$(print $(gpgkey)'%{\e[1;32m%}%n@%m%{\e[0m%}'): %3~%b %# "
#fi

#export PYTHONPATH=${PYTHONPATH}:${HOME}/code/netkine/infrastructure:.

#export LS_COLORS='no=00:fi=00:di=01;33:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35:';
export LS_COLORS='no=00:fi=00:di=01;33:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:';



export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib

# Make sure we can dump core
ulimit -c unlimited

updatecscope() {
    LNX=${HOME}/code/nile/ubuntu-saucy-kernel
    echo "Running find on ${LNX}..."
    find ${LNX} \
        -path "$LNX/arch/*" ! -path "$LNX/arch/i386*" -prune -o               \
        -path "$LNX/include/asm-*" ! -path "$LNX/include/asm-i386*" -prune -o \
        -path "$LNX/tmp*" -prune -o                                           \
        -path "$LNX/Documentation*" -prune -o                                 \
        -path "$LNX/scripts*" -prune -o                                       \
        -path "$LNX/drivers*" -prune -o                                       \
        -path "$LNX/nk_build*" -prune -o                                       \
        -path "$LNX/debian*" -prune -o                                       \
        -path "$LNX/ubuntu*" -prune -o                                       \
        -name "*.[chxsS]" -print > ${HOME}/cscope.files

    echo "Updating cscope..."
    (cd ${HOME} && cscope -b -q -k)
    echo "done"
}


branches() {
    branch=$(git rev-parse --abbrev-ref HEAD)
    echo current - $branch
    for d in */.git; do
        proj=$(basename $(dirname ${d}))
        branch=$(cd ${proj} && git rev-parse --abbrev-ref HEAD)
        echo $proj - $branch
    done
}
branch-all() {
    if [ "$2" != "" ] ; then
        upstream=$2
    else
        upstream="upstream/master"
    fi
    git checkout -b $1 ${upstream}
    for d in */.git; do
        proj=$(basename $(dirname ${d}))
        (cd ${proj} && git checkout -b $1 ${upstream})
    done
}

change_branches() {
    branch=$1
    for d in */.git; do
        proj=$(basename $(dirname ${d}))
PS1='$(_gpgkey)$(print "%{\e[1;32m%}%n@%m%{\e[0m%}"):$(_machine):$(__git_ps1) %3~%b %# '
        if (cd ${proj} && git checkout ${branch} 2>/dev/null >/dev/null) ; then
            echo "${proj} \e[1;32mnow on ${branch}\e[0m"
        else
            echo "${proj} \e[1;41mERROR (invalid branch)\e[0m"
        fi
    done
}

undocker() {
    unset DOCKER_TLS_VERIFY
    unset DOCKER_HOST
    unset DOCKER_CERT_PATH
    unset DOCKER_MACHINE_NAME
}

alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'

alias ls='ls --color -F'
export EDITOR=vim
export DEBEMAIL='daniel@netkine.com'
export OS_USERNAME=admin
export OS_TENANT_NAME=admin
export OS_AUTH_URL=https://keystone-ncc01-01.netkine.com:5000/v2.0
# export OS_PASSWORD=foobar
export LIVE_VM_NETWORK=default

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
# export GO15VENDOREXPERIMENT=1
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
source ${HOME}/code/pass.zsh-completion
