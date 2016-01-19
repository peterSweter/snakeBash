function init_level
{
	snake_size=0;
	move=0
	setAppleCords;
	
	matrix[$apple_y,$apple_x]=4;

	snake_head_x=$((${width[$lvl]}/2))
	snake_head_y=$((${height[$lvl]}/2))
	
	last_update_time=$(($(date +%s%N)/1000000))

}
# 0
height[0]=20
width[0]=30
gapX_b[0]=100
gapX_e[0]=-1
gapY_b[0]=2
gapY_e[0]=17
max_snake[0]=8
frame_time[0]=150

# 1
height[1]=25
width[1]=45
gapX_b[1]=20
gapX_e[1]=34
gapY_b[1]=100
gapY_e[1]=-1
frame_time[1]=100
max_snake[1]=15
