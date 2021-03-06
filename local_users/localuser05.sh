#!/bin/bash 


# This script genarate random password list 

pass1="${RANDOM}"

echo "Password generated by using RANDOM keyword : ${pass1}"

pass2="${RANDOM}${RANDOM}"

echo "Password generated by using RANDON keyword 2 times : ${pass2}"

pass3="$(date +%s)"

echo "Password generated by using date command's epoch time : ${pass3}"

pass4="$(date +%s%N)"

echo "Password generated by using date command's epoch and nano time both : ${pass4}"

pass5="$(date +%s%N | sha256sum)"

echo "Password generated using using date command's epoch and nano time both provided to sha256sum : ${pass5}"

pass6=$(date +%s%N | sha256sum | head -c8)

echo "Password generated using using date command's epoch and nano time both provided to sha256sum and first 8 characters taken from it only : ${pass6}"

characters=$(date +%s%N | sha256sum | head -c6)
special_char=$(echo '!@#$%*' | fold -w2 | shuf | head -c2)

pass7=${characters}${special_char}

echo "Password with random characters, numbers and special characters : ${pass7}"


