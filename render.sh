function render
{
	echo >screen #faster PC MASTER RACE - ONLY 144 FPS, and no flickering
	tmpChar=' '
	for ((i=0; i<height; i++)) do
		for ((j=0; j<width; j++)) do
			case ${matrix[$i,$j]} in
				0) tmpChar='\e[40m \e[0m' ;;
			 	1) tmpChar='\e[47mX\e[0m' ;;
				2) tmpChar='O' ;;
				4) tmpChar='\e[31m@\e[0m' ;;
			esac
			echo -en "$tmpChar" >>screen

		done
		#Score displaying
		if [ $i -eq 0 ] ; then
			echo -n " Score: $score" >>screen
		fi
		echo "" >>screen
	done
	clear
	cat screen 
}
