source ./header.sh
source ./input.sh
source ./update.sh
source ./render.sh
source ./sleep.sh

init
while [ $game_state -eq 1 ] ; do
	take_input
	update
	render
	hold
done
