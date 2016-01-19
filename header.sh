function disable_cursor
{
	stty -echo
	tput civis
}
disable_cursor

game_state=0

declare -A matrix

snake_head_x=2;
snake_head_y=2;

apple_x=1;
apple_y=1;

pressed_key=o

score=0;
snake_size=0;

declare -A Segment_position_x
declare -A Segment_position_y

last_update_time=0

# levels variables
declare -A height
declare -A width
declare -A special
lvl=0
#end level variables

function init
{
	game_state=1
	score=0;
	init_level
}
function finish
{
	stty echo
	tput cnorm
	tput sgr0
}
trap finish EXIT
