function update
{
	case "$pressed_key" in
	w) [ $move -ne 2 ] && ((move=1)) ;;
	s) [ $move -ne 2 ] && ((move=2)) ;;
	a) [ $move -ne 4 ] && ((move=3)) ;;
	d) [ $move -ne 3 ] && ((move=4)) ;;
	q) game_state=0 ;;
	e) ((move=0)) ;;
	esac

	moveSnake;
	
	case "$move" in
	1) ((snake_head_y--));;
	2) ((snake_head_y++));;
	3) ((snake_head_x--));;
	4) ((snake_head_x++));;
	esac

	checkSnakeCollision;
	if [ $game_state -ne 1 ] ; then
		return
	fi
	


	for ((i=1; i+1<height; i++)) do
		for ((j=1; j+1<width; j++)) do
			matrix[$i,$j]=0
		done
	done

	matrix[$apple_y,$apple_x]=4;
	drawSnake;
	
}
