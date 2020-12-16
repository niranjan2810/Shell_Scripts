#!/bin/bash 


# This script demo how to use getopts shell builtin for processing command line options


# This will generate random password 
# User should set the lenght of the password with -l options and special character to be added or not with -s options 
# User can enable verbose mode using -v options 


while getopts vl:s options 

do 
	case ${options} in
	
	  v)
		echo "This is verbose option..!!"
		;;
	  l)
		echo "This is lenght option..!!"
		length="${OPTARG}"				# Assign the argument provided by user with l option to lenght variable
		echo "Length provided = ${length}"
		;;
	  s)
		echo "This is special option..!"
		special_character='true'
		;;
	  *)
		echo "Invalid option..!!"
		exit 1
		;;
	esac

done

password=$(date +%s%N | sha256sum | head -c${length})
special_char=$(echo '!@#$%*' | fold -w2 | shuf | head -c2)

if [[ "${special_character}" = 'true' ]]
then 
	${password}="${password}${special_char}"
	echo "Password is created and is equals to ${password}"
fi

echo "Password generated as : ${password}"

