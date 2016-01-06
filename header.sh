function disable_cursor
{
	stty -echo
	tput civis
}
disable_cursor

game_state=0

declare -A matrix
height=20
width=25

snake_head_x=1;
snake_head_y=1;

apple_x=1;
apple_y=1;

pressed_key=o

score=0;
snake_size=0;

declare -A Segment_position_x
declare -A Segment_position_y


function init
{
	game_state=1
	setAppleCords;
	score=0;
	snake_size=0;
	snake_head_x=1;
	snake_head_y=1;
	move=0

	for ((i=0; i<height; i++)) do
		for ((j=0; j<width; j++)) do
			if ((i==0 || j==0 || i+1==height|| j+1==width)); then
				matrix[$i,$j]=1
			else
				matrix[$i,$j]=0
			fi
		done
	done

	matrix[$apple_y,$apple_x]=4;

	snake_head_x=$(($width/2))
	snake_head_y=$(($height/2))
}
function finish
{
	stty echo
	tput cnorm
	tput sgr0
}
trap finish EXIT
