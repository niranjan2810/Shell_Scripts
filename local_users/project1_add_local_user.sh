#!/bin/bash

# This is script written for creating a local user 
# Script can only be executed if user is root 

# Getting user ID and username of the user who is executing the script 

userid=${UID}
usrname=$(id -un)
hostname=${HOSTNAME}

# Checking if the user is Root user i.e. it should have user ID equal to 0

if [[ "${userid}" -ne 0 ]]
then
	echo "${usrname} is not root user and hence cannot execute this..!!"
	#echo "Password of your account is ${password}"
	exit 1									#If not root user, it exists with status code 1
fi 

# Asking the user for the username, name and password of the account to be created

echo "You have root rights and you can execute this script..!!"
read -p "Enter username to be set for the user : " newuser
read -p "Enter Name of the user to store in DB : " newname
read -p "Enter password to be set for the user : " newpass

useradd -m "${newuser}"								# Creating new user 

if [[ "${?}" -ne 0 ]]								# Checking if account cretion is successful 
then
	echo "Something went wrong in account creation..!!"		
	exit 1
fi
	
echo "${newpass}" | passwd --stdin "${newuser}"					# Providing password to password command
passwd -e "${newuser}"								# Making user change password on first login

echo "Your username is ${newuser}"
echo "Your name is ${newname}"
echo "Your password is ${newpass}"
echo "Created your account on the host ${hostname}"
exit 0
