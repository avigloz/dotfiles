blu="%{F#55aaff}" # blue
yel="%{F#ffff55}" # yellow
nc="%{F#ffffff}" # no color
grn="%{F#55ff55}" # green
red="%{F#ff5555}"

tot=`xdotool get_num_desktops`

datetime(){
	date '+%h.%d (%a)/%Y %I:%M%p'
}

sound(){
	awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master)
}

window(){ # this is not very functional atm
	echo "$(xdotool getwindowfocus getwindowname | cut -c 1-70)"
}

song(){
	#echo "$(playerctl metadata title) - $(playerctl metadata artist)"
	#playerctl metadata -f "{{title}} - {{artist}}"
	cat $HOME/.song
}

eth(){
    ping -c 1 1.1.1.1 >/dev/null 2>&1 && 
        echo "${grn}Connected${nc}" || echo "${red}Disconnected${nc}"
}

groups() {
	# taken from z3bra.org, modified
	cur=`xdotool get_desktop`

    for w in `seq 0 $((cur - 1))`;
    	do line="${line}o ";
     done

    line="${line}${blu}@ ${nc}"
    for w in `seq $((cur + 2)) $tot`; 
    	do line="${line}o "; 
    done
    echo $line
}

while :; do	
	buf="%{l}$(groups)" # -- ${yel}$(window)${nc}"
	buf="${buf} %{c}${yel}$(song)${nc}"
	buf="${buf} %{r}$(datetime) -"
	buf="${buf} $(eth) -"
	buf="${buf} VOL: ${blu}$(sound)${nc}"
	echo $buf
	sleep 0.1
done
