#!/bin/bash

#Display the UID and Username of the user that is executing the script 
#Display if the user is the vagrant user or not 

# Display the UID

echo "UID for the user is ${UID}"

# Display something if the UID does not match 1000

std_uid='1000'

if [[ "${UID}" -ne "${std_uid}" ]]
then 
	echo "Your UID does not match ${std_uid}"
fi

# Display the username 

user_name=$(id -un)

# Test if command succeeded 

if [[ "${?}" -ne 0 ]]
then 
	echo "The username printing command does not executed successfully"
	exit 1 
fi

echo "Your username is ${user_name}"

# Test for equal to the string 

username='vagrant'

if [[ ${user_name} = ${username} ]]

then 
	echo "Your username matches ${username}"
fi

