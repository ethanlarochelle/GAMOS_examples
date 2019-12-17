#/bin/bash

START=$1
RES=$2
FMT=$3

j=$START;
str="000000";

for i in G4OpenGL*.eps; 
	do
		length=${#j};
		newstr="${str:0:5-length+1}$j";
		command="convert -scale $RES G4OpenGL_$j.eps G4OpenGL_$newstr.$FMT"; 
		j=$(($j+1));
		echo $command; 
		$command; 
	done