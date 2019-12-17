#/bin/bash

FILENAME=$1
FPS=$2
QUAL=$3
FMT=$4

command="convert -delay 1x$FPS -quality $QUAL% -compress None -antialias -morph 3 *.$FMT -monitor $FILENAME.mpeg"
echo $command;
$command;