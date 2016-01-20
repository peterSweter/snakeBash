function render
{
	screen=""		#moved screen from disk to RAM - faster rendering
	#echo >screen #faster PC MASTER RACE - ONLY 144 FPS, and no flickering
	tmpChar=' '
	background="\e[48;5;119m"
	snake_color="\e[38;5;208m"
	normal="\e[0m"
	apple_color="\e[38;5;9m"
	wall_color="\e[48;5;17m"
	for ((i=0; i<height[$lvl]; i++)) do
		for ((j=0; j<width[$lvl]; j++)) do
			case ${matrix[$i,$j]} in
				0) tmpChar="$background\e[1m $normal" ;; #nothing
			 	1) tmpChar="$wall_color\e[1m $normal" ;;
				2) tmpChar="$snake_color$background\e[1mO$normal" ;;
				4) tmpChar="$background$apple_color\e[1m@$normal" ;;
			esac
			screen+="$tmpChar"
		done
		#Score displaying
		if [ $i -eq 0 ] ; then
			screen+=" Score: $score"
		fi
		if [ $i -eq 1 ] ; then
			screen+=" Apples left:"
		fi
		if [ $i -eq 2 ] ; then
			screen+=" $(((${max_snake[$lvl]}-$snake_size)/${snake_grow[$lvl]}+1))"
		fi
		screen+="\n"
	done
	clear		# double buffering lol
	echo -e "$screen"
}
