#!/bin/bash


# Display the User ID and username of the user executing this script 

# Display if the user is the root user or not 


# Display User ID 

echo "Your UID is ${UID}"	#UID is the shell built in which gives User ID 

#UID="1001"	UID cannot be changed to any other value as it is ReadOnly (Hence commanted out in the script)

echo "Your UID is ${UID}"

echo "Your Effective UID is ${EUID}"	#Similar to UID this is Effective UID

# Display the username 

echo "Your username using id command $(id -un)"

echo "Your username using whoami command $(whoami)"

User_Name1=$(id -un)
echo "Your username using id command stored in variable ${User_Name1}"

User_Name2=$(whoami)
echo "Your username using id command stored in variable ${User_Name2}"

User_Name=`id -un`
echo "Username as taken with old method ${User_Name}"

if [[ "${UID}" -eq 0  ]]

echo "This is out of the else statement hence will get printed..!!"

then
	echo "You are root"
else
	echo "You are not root"
fi


