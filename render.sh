function render
{
	screen=""		#moved screen from disk to RAM - faster rendering
	#echo >screen #faster PC MASTER RACE - ONLY 144 FPS, and no flickering
	tmpChar=' '
	for ((i=0; i<height[$lvl]; i++)) do
		for ((j=0; j<width[$lvl]; j++)) do
			case ${matrix[$i,$j]} in
				0) tmpChar='\e[40m \e[0m' ;; #nothing
			 	1) tmpChar='\e[47mX\e[0m' ;;
				2) tmpChar='O' ;;
				4) tmpChar='\e[31m@\e[0m' ;;
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
	echo -e $screen
}
