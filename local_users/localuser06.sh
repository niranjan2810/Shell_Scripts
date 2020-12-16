#!/bin/bash 

# This script generates a random password for each user specified on the command line 


echo "You just executed this command : ${0}"

echo "First argument provided to the command : ${1}"

echo "Number of arguments provided to the command : ${#}"

echo "These are the arguments provided to the command : ${*}"

echo "These are the arguments provided to the command : ${@}"

for users in "${@}"
do
	characters=$(date +%s%N | sha256sum | head -c6)
	special_char=$(echo '!@#$%*' | fold -w2 | shuf | head -c2)
	password=${characters}${special_char}
	echo "Password for ${users} is generated as : ${password}"
done


