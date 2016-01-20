function init_level
{
	((lvl++))
	if ((lvl == 3)) ; then
		((lvl--))
	fi
	
	if (( $lvl > 1 )) ; then
		height[2]=$(($RANDOM%20+9))
		width[2]=$(($RANDOM%60+15))
		gapY_b[2]=$(($RANDOM%20+10))
		gapY_e[2]=$(($RANDOM%20+10))
		gapX_b[2]=$(($RANDOM%60+10))
		gapX_e[2]=$(($RANDOM%60+10))
		max_snake[2]=$(($RANDOM%$(((${height[2]}/2)*(${width[2]}/3)))+3))
		frame_time[2]=$(($RANDOM%80+80))
		snake_grow[2]=$(($RANDOM%6+2))
	fi
	
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
max_snake[0]=40
frame_time[0]=150
snake_grow[0]=3

# 1
height[1]=25
width[1]=45
gapX_b[1]=20
gapX_e[1]=34
gapY_b[1]=100
gapY_e[1]=-1
frame_time[1]=100
max_snake[1]=100
snake_grow[1]=5
