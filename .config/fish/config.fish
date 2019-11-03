# file: ~/.bash_profile
set -gx GOROOT /usr/lib/go            
set -gx GOPATH ~/.gocode

set -gx PATH $PATH $GOROOT/bin
set -gx PATH $PATH $GOPATH/bin
set -gx PATH $PATH /opt/gradle/gradle-5.0/bin
set -gx PATH $PATH /home/martin/.local/bin 
set -gx PATH $PATH /home/martin/.npm-global/bin
set -gx PATH $PATH /usr/local/texlive/2019/bin/x86_64-linux
set -gx PATH $PATH /var/lib/snapd/snap/bin

set fish_greeting

function mltø
	 cd ~/Dropbox/UNI/S5/Machine\ Learning/TØ
	 jupyter notebook
end

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
alias ipy "ipython"
alias l "ls -lh"
alias vi "nvim"
alias open "xdg-open"
alias aflevering "~/Dropbox/UNI/.aflevering.py"
alias zzz "systemctl suspend"
alias gimmeh "sudo apt install"
alias timer "java -jar ~/Dropbox/UNI/Programmer/Eksamenstimer.jar & disown"
alias dubidub "mplayer ~/Diverse/dudidud.mp3 -ss 04 -endpos 0.7 > /dev/null 2>&1"
alias top "chafa ~/Diverse/top.jpg"
alias ccat='pygmentize -g'
alias bbdownload '/home/martin/Dropbox/Projekter/Python/Blackboard-Scripts/download.py'
alias http-server 'python3 -m http.server'
alias fix-caps 'setxkbmap -option ctrl:swapcaps'
alias fix-network 'systemctl restart network-manager'
