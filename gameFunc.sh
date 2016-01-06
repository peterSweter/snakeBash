function setAppleCords
{
  apple_x=$[ 1 + $[ RANDOM % (width-2) ]]
  apple_y=$[ 1 + $[ RANDOM % (height-2) ]]
}

function checkSnakeCollision
{
  if [ $snake_head_x -eq $(($width-1)) ] || [ $snake_head_x -eq 0 ] || [ $snake_head_y -eq 0 ] || [ $snake_head_y -eq $(($height-1)) ] ; then
    init;
  fi

  for ((i=$snake_size;$i>0;i--)) ; do
    if [ $((Segment_position_x[$i])) -eq $snake_head_x ] && [ $((Segment_position_y[$i])) -eq $snake_head_y ] ; then
      init;
    fi
  done


  if [ $apple_x -eq $snake_head_x ] && [ $apple_y -eq $snake_head_y ] ; then
    ((score++));
    ((snake_size++));
    setAppleCords;

  fi
}

function moveSnake
{
  Segment_position_x[0]=snake_head_x;
  Segment_position_y[0]=snake_head_y;
  for ((i=$snake_size;$i>0;i--)) ; do
    Segment_position_x[$i]=$((Segment_position_x[$(($i-1))]));
    Segment_position_y[$i]=$((Segment_position_y[$(($i-1))]));

  done
}

function drawSnake
{

  matrix[$snake_head_y,$snake_head_x]=2;

  for ((i=$snake_size;$i>0;i--)) ; do
    if [ $((Segment_position_y[$i])) != 0 ] ; then
      matrix[$((Segment_position_y[$i])),$((Segment_position_x[$i]))]=2;
    fi;

  done

}
