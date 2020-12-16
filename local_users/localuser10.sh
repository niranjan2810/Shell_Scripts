#!/bin/bash

# This script is written for showing demo of the 'Functions'

log1() {						# Defined function with syntax 1
	echo 'You are calling Log Function..!!'
}

log1

function log2 {									# Defined function using syntax 2 
	echo 'You are callimg Log function using function keyword..!!'
}

log2

log() {
	local var="${@}"
	echo This is what was passed as argument to log function : "${var}"
}

log 'Hello..!!' 'Good morning..!!' # Two arguments are passed to the function and with "${@}" all the arguments gets read and will be provided to "${var}"


conditional_function() {
	
	local var="${@}"
	if [[ "${VERBOSE}" = 'true' ]]
	then
		echo "${var}"
	fi
}

conditional_function 'This will not get print..!!'
VERBOSE='true'
conditional_function 'This will get print..!!'

exit 0
