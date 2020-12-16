#!/bin/bash

echo "Number of arg : ${#}"
echo "All arg : ${@}"
echo "1st agr : ${1}"
echo "2nd agr : ${2}"
echo "3rd agr : ${3}"
echo "4th agr : ${4}"

echo "OPTIND : ${OPTIND}"
shift "$(( OPTIND - 1 ))"

echo "OPTIND : ${OPTIND}"
