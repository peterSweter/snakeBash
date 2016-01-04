function take_input
{
	pressed_key=0
	while IFS= read -rs -t 0.0001 -n 1 key
	do 
		pressed_key=$key
	done
}
