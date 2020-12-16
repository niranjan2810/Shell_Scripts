#!/bin/bash

# This script demo the use of 'Case Statement'


# Following loop print the statements according to the value provided as 1st argument (i.e. equating it to "${1}")

if [[ "${1}" = "Start" ]]
then 
	echo "Starts with Start"

elif [[ "${1}" = "Stop" ]]
then
	echo "Starts with Stop"

#else 
#	echo "The input is not valid..!!"
#	exit 1
fi

# The same exact thing we will be doing with the case statement 

case "${1}" in 

	Start|start)
    		echo "Printed with case statement : Starts with Starting"
		;;
	Stop|stop)
		echo "Printed with case statement : Starts with Stop"
		;;
	*)
		echo "Printed with case statement : Not a valid input"
		exit 1
		;;
esac
