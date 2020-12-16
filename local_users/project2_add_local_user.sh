#!/bin/bash

# This script is written to create users with  root privilages only 
# Generate account with username equals to first argument provided on the command line
# Other argument if provided any will be treated as comment for the account 


# Checking if the user is Root user i.e. it should have user ID equal to 0

if [[ "${UID}"  -ne 0 ]]
then
        echo "$(id -un) is not root user and hence cannot execute this..!!"
        exit 1                                                                  #If not root user, it exists with status code 1
fi

# Checking if user at least provides one argument which is to be used as username for account creation or not 

username=${1}									# 1st parameter provided by user 

if [[ "${#}" -eq 0 ]]								# If number of arguments are equal 0
then
	echo "No username is provided. Please provide username of the user to be created."
	exit 1
fi

shift										# Shifted the arguments by 1 so 1st gets chopped off
comment="${@}"									# Getting all the other arguments in one variable so that can be used as comment 

# Creating account with username equal to first argument provided on command line 

adduser -c "${comment}" -m "${username}"					# Comment is used that is equal to all the argumets passed than 1st i.e. 1st chopped

if [[ "${?}" -ne 0 ]]                                                           # Checking if account cretion is successful by checking exit status of recent 
then										# most command executed 
        echo "Something went wrong in account creation..!!"             
        exit 1
fi

characters=$(date +%s%N | sha256sum | head -c6)
special_char=$(echo '!@#$%*' | fold -w2 | shuf | head -c2)
password=${characters}${special_char}						# Created password 

echo "${password}" | passwd --stdin "${username}"                               # Providing password to password command

if [[ "${?}" -ne 0 ]]                                                           # Checking if password cretion is successful by checking exit status of recent most command
then
        echo "Something went wrong in password creation..!!"             
        exit 1
fi

passwd -e "${username}"                                                         # Force change password on 1st login 

echo "New account is created for : ${username}"
echo "Password for the account is : ${password}"

exit 0
