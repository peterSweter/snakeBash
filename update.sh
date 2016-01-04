function update
{
	case "$pressed_key" in
	a) ((move=3)) ;;
	d) ((move=4)) ;;
	w) ((move=1)) ;;
	s) ((move=2)) ;;
	q) game_state=0 ;;
	e) ((move=0)) ;;
	esac
	
	case "$move" in
	1) ((snake_head_y--));;
	2) ((snake_head_y++));;
	3) ((snake_head_x--));;
	4) ((snake_head_x++));;
	esac
	
	for ((i=1; i+1<height; i++)) do
		for ((j=1; j+1<width; j++)) do
			matrix[$i,$j]=0
		done
	done
	
	matrix[$snake_head_y,$snake_head_x]=2
}
