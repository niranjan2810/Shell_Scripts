#!/bin/bash


# This script is written to delete users 

readonly arch='/archive'

usage() { 
	echo 'Use script providing the option and username like following : '
	echo 'Enter valid options 1. d for delete 2. r for remove home directory and delete 3. Archive and delete'
	echo 'Enter user that is to be disabled or deleted followed by space after option'
	exit 1
}

if [[ "${UID}"  -ne 0 ]]
then
        echo "$(id -un) is not root user and hence cannot execute this..!!"
        exit 1                                                                  #If not root user, it exists with status code 1
fi

while getopts dra options 
do 
	case ${options} in
		d) delete='true' ;;
		r) remove='-r' ;;
		a) archive='true' ;;
		*) usage ;;
	esac
done

shift "$(( OPTIND - 1 ))" # shifting all the way to end of all the options(including arguments of options if any) and at start of arguments 

if [[ "${#}" -eq 0 ]]
then 
	usage
fi

for usernames in "${@}"
do 
	echo "Processing ${usernames}"
	
	userid=$(id -u ${usernames})
	if [[ ${userid} -lt 1000 ]]
	then
		echo "This account ${usernames} cannot be disables or deleted"
		exit 1 
	fi

	if [[ "${archive}" = 'true' ]]
	then 
		if [[ ! -d "${arch}" ]] 
		then
			echo 'Creating directory'
			mkdir -p ${arch}
			if [[ "${?}" -ne 0 ]]
			then
				echo 'There was error creating directory..!!'
				exit 1
			fi
		fi
	
	home_dir="/home/${usernames}"
	mv ${home_dir} ${arch}
	
		if [[ "${?}" -ne 0 ]]
		then
			echo "Could not back up the files of user"
			exit 1
		fi
	fi

	if [[ "${delete}" = 'true' ]]
	then 
		userdel ${remove} ${usernames}
		
		if [[ "${?}" -ne 0 ]]
		then
			echo "This ${usernames} does not deleted"
			exit 1
		fi
		
		echo "The account was deleted" 
	else
		chage -E 0 ${usernames}
		if [[ "${?}" -ne 0 ]]
		then 
			echo "There was some issue disabling the account..!!"
			exit 1 
		fi 

		echo "The account was disabled" 
	fi
done

exit 0
