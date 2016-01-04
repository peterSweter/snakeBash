function render 
{
	echo >screen #faster PC MASTER RACE - ONLY 144 FPS, and no flickering
	tmpChar=' '
	for ((i=0; i<height; i++)) do
		for ((j=0; j<width; j++)) do
			case ${matrix[$i,$j]} in	
				0) tmpChar=' ' ;;
			 	1) tmpChar='X' ;;
				2) tmpChar='*' ;;
			esac
			echo -n "$tmpChar" >>screen
		done
		echo "" >>screen
	done
	clear
	cat screen
}
