stty -echo
tput civis

game_state=0

declare -A matrix
height=15
width=30

snake_head_x=1;
snake_head_y=1;

pressed_key=o

function init
{
	game_state=1
	
	for ((i=0; i<height; i++)) do
		for ((j=0; j<width; j++)) do
			if ((i==0 || j==0 || i+1==height|| j+1==width)); then
				matrix[$i,$j]=1
			else
				matrix[$i,$j]=0
			fi
		done
	done
	
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
