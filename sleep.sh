function hold
{
	wanted_difference=130
	new_time=$(($(date +%s%N)/1000000))
	difference=$(( $new_time - $last_update_time ))
	sleep_time=$(echo "scale=4;$wanted_difference/1000-$difference/1000"| bc)
	sleep_time=$(echo $sleep_time | awk '{ if ($1<0) {print 0} else {print $1}}')
	sleep $sleep_time
	last_update_time=$(($(date +%s%N)/1000000))
}
