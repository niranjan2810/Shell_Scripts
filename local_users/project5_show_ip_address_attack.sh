#!/bin/bash


# This script is written to show the IP address if failed login attempts are more than 10 

Limit='10'
Input_File="${1}"
Output_File="${2}"

usage() { 
echo "Please provide the log file which will be used to find more than ${Limit} failed login attempts"
echo "Please provide the log file also to which output is to be saved"
}

if [[ "${#}" -eq 0 ]]
then 
	usage
	exit 1 
fi

echo "Number of Attempts	IP ADDRESS	LOCATION OF IP ADDRESS" >> ${Output_File}

grep Failed ${Input_File} | awk '{print $(NF - 3)}' | sort -n | uniq -c | sort -nr | while read COUNT IP_ADD
do 
	if [[ "${COUNT}" -gt "${Limit}" ]] 
	then 
		LOC=$(geoiplookup ${IP_ADD})
		echo "${COUNT}			${IP_ADD} 	${LOC}" >> ${Output_File}
	fi
done

exit 0

