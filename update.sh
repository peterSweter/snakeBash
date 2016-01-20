function update
{
	case "$pressed_key" in
	w) [ $move -ne 2 ] && ((move=1)) ;;
	s) [ $move -ne 1 ] && ((move=2)) ;;
	a) [ $move -ne 4 ] && ((move=3)) ;;
	d) [ $move -ne 3 ] && ((move=4)) ;;
	q) game_state=0 ;;
	e) ((move=0)) ;;
	n) init_level ;;#cheats lol
	esac

	moveSnake;
	
	case "$move" in
	1) ((snake_head_y--));;
	2) ((snake_head_y++));;
	3) ((snake_head_x--));;
	4) ((snake_head_x++));;
	esac
	
	((snake_head_y+=${height[$lvl]}))
	((snake_head_y%=${height[$lvl]}))
	((snake_head_x+=${width[$lvl]}))
	((snake_head_x%=${width[$lvl]}))
	
	if [ $move -ne 0 ] ; then
		checkSnakeCollision;
	fi
	
	if [ $game_state -ne 1 ] ; then
		return
	fi
	
	if [ $snake_size -gt $((${max_snake[$lvl]})) ] ; then
		init_level
	fi
	


#	for ((i=1; i+1<height[$lvl]; i++)) do
#		for ((j=1; j+1<width[$lvl]; j++)) do
#				matrix[$i,$j]=0
#		done
#	done
	for ((i=0; i<height[$lvl]; i++)) do
		for ((j=0; j<width[$lvl]; j++)) do
			if (( (i==0 || i+1==height[$lvl]) && (j<gapX_b[$lvl] || j>gapX_e[$lvl]  ))); then
				matrix[$i,$j]=1
			elif (( (j==0 || j+1==width[$lvl]) && (i<gapY_b[$lvl] || i>gapY_e[$lvl] ))); then
				matrix[$i,$j]=1
			else 
				matrix[$i,$j]=0
			fi
		done
	done

	matrix[$apple_y,$apple_x]=4;
	drawSnake;
	
}
