#!/bin/bash
# Created by daggoth
# http://crunchbang.org/forums/viewtopic.php?pid=295676#p296114

xresrc="$HOME/.Xresources"
normal="$(tput sgr0)"
bold="$(tput bold)"

C=( $( grep -i urxvt[.*]color[0-9]* <"$xresrc" |
       cut -d: -f2                             |
       tr -d [:blank:]                         ) )

V=( $( grep -i urxvt[.*]color[0-9]* <"$xresrc" |
       cut -d: -f1                             |
       tr -d '[a-z-A-Z].*'                     ) )

for i in {0..7..2} ; do
	color="$(tput setaf ${V[$i]})"
	top1+="$color ▉▉▉▉ ${C[$i]} "
	bot1+="$bold$color ▉▉▉▉ ${C[$(($i+1))]} "
done

for i in {8..15..2} ; do
	color="$(tput setaf ${V[$i]})"
	top2+="$color ▉▉▉▉ ${C[$i]} "
	bot2+="$bold$color ▉▉▉▉ ${C[$(($i+1))]} "
done

echo -en "\n$normal$top1\n\n$bot1\n"
echo -e  "\n$normal$top2\n\n$bot2\n$normal"