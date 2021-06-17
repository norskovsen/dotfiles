set -gx PATH $PATH /opt/gradle/bin
set -gx PATH $PATH ~/midlang
set -gx PATH $PATH ~/.local/bin
set -gx PATH $PATH ~/.deno/bin
set -gx PATH $PATH ~/Diverse/
set -Ux EDITOR nvim
set -Ux TROUPE ~/Repos/Troupe/
set -gx PATH $PATH $TROUPE/bin


export QT_AUTO_SCREEN_SCALE_FACTOR=0

function sudo
    if test "$argv" = !!
    eval command sudo $history[1]
else
    command sudo $argv
    end
end

function ra
    set tmpfile "/tmp/pwd-from-ranger"
    ranger --choosedir=$tmpfile $argv
    set rangerpwd (cat $tmpfile)
    if test "$PWD" != $rangerpwd
        cd $rangerpwd
    end
end

alias ls "ls -B"
alias weather "curl wttr.in"
alias xclip "xclip -sel clip"
alias ipy "ipython3"
alias l "ls -lh"
alias vi "nvim"
#alias open "xdg-open"
alias aflevering "~/Dropbox/UNI/.aflevering.py"
alias zzz "systemctl suspend"
alias gimmeh "sudo apt install"
alias timer "java -jar ~/Dropbox/UNI/Programmer/Eksamenstimer.jar & disown"
alias sl "ls"

alias icat 'kitty +kitten icat'
alias top "icat --align left ~/Diverse/top.jpg"
alias høker "icat --align left ~/Diverse/hoeker.png"

alias ccat='pygmentize -g'
alias bbdownload '/home/martin/Dropbox/Projekter/Python/Blackboard-Scripts/download.py'
alias http-server 'python3 -m http.server'
alias fix-caps 'xmodmap ~/.xmodmap'
alias fix-network 'systemctl restart network-manager'
alias plz 'sudo'
alias copy 'xclip -sel clip'
alias sound-reset 'killall volumeicon ; env Exec=env GTK_THEME=Arc:dark volumeicon & disown'
alias fix-padding 'bspc config top_padding 0'
alias vejret 'wget https://www.yr.no/sted/Danmark/Midtjylland/%C3%85rhus/varsel.pdf -O /tmp/varsel.pdf; zathura /tmp/varsel.pdf & disown'

# Notifications
alias do-not-disturb 'killall -SIGUSR1 dunst'
alias disable-do-not-disturb 'killall -SIGUSR2 dunst'

# Programs
alias eksamenstimer 'gradle -p ~/Dropbox/UNI/Programmer/MultipleChoiceTimer/ run'
alias sympy 'ipython3 -i ~/Dropbox/Projekter/Python/sympy_prompt.py'

# Radio
alias p1 'mplayer -playlist ~/Documents/Radio/p1.mp3.m3u'
alias p2 'mplayer -playlist ~/Documents/Radio/p2.mp3.m3u'
alias p3 'mplayer -playlist ~/Documents/Radio/p3.mp3.m3u'
alias p4 'mplayer -playlist ~/Documents/Radio/p4-ostjylland.mp3.m3u'

# Sounds
alias louder '~/Diverse/musicify'
alias dubidub "mplayer ~/Diverse/dudidud.mp3 -ss 04 -endpos 0.7 > /dev/null 2>&1"
alias fubini "mplayer ~/Diverse/fubini.mp3 -ss 53  > /dev/null 2>&1"
alias dramatic "mplayer ~/Diverse/sounds/dramatic.mp3 > /dev/null 2>&1"
alias bitch "mplayer ~/Diverse/sounds/bitch.mp3 > /dev/null 2>&1"
alias yes "mplayer ~/Diverse/sounds/yes.mp3 -ss 01 > /dev/null 2>&1"
alias attention "mplayer ~/Diverse/attention.mp3 -ss 10 -endpos 2 > /dev/null 2>&1"

#alias python python3
#alias pip pip3

alias git-fix 'git pull --commit ; git push'

function fish_right_prompt
  #intentionally left blank
end

# System

# opam configuration
source /home/martin/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# midlang 
#alias mid 'docker run --rm --network="host" -ti -v (pwd):/home/work midlang mid'
#
# Haskell 
source /home/martin/.ghcup/env
