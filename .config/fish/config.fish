# file: ~/.bash_profile
set fish_greeting

set -gx PATH $PATH /opt/gradle/gradle-5.6.4/bin

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
alias høker "chafa ~/Diverse/hoeker.png"
alias ccat='pygmentize -g'
alias bbdownload '/home/martin/Dropbox/Projekter/Python/Blackboard-Scripts/download.py'
alias http-server 'python3 -m http.server'
alias fix-caps 'setxkbmap -option ctrl:swapcaps'
alias fix-network 'systemctl restart network-manager'
alias plz 'sudo'

function fish_right_prompt
  #intentionally left blank
end
