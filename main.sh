#!/bin/bash
source ./gameFunc.sh
source ./header.sh
source ./input.sh
source ./update.sh
source ./render.sh
source ./sleep.sh


init
while [ $game_state -eq 1 ] ; do
	take_input
	update
	if [ $game_state -eq 1 ] ; then
		render
	fi
	hold
	if [ $game_state -eq 2 ] ; then
		init
	fi
done
