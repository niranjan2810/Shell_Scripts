#!/bin/bash

# This script displays various imformation to the screen 

# Displays Hello

echo 'Hello..!!'

#Displays Namskar 

echo 'Namskar..!!'

#Assigning value to variable 

word='script'

#Display the value of variable
echo "$word"

#Demo that use of single quotes does not use the value assigned to variable
#Meaning single quotes does not interprets the variable 
#Hence to interpret the variable variable name should be used in double quotes with $ at the start of variable name

echo '$word'	#Displays $word 
echo "$word"	#Display value of variable named word 

#Combine hard coded text and variable 

echo "This is the value of variable word = $word"

#Combine hard coded text and variable with different syntax 

echo "This is the value of variable word = ${word}"

#Append text to variable name 

echo "This is ${word}ing..!!"

#Create new variable 

ending='ed'

#Combine two variables 

echo "This is ${word}${ending}..!!"

#Change value of the variable 

ending='ing'

#Combine two variables after change of values 

echo "This is ${word}${ending}..!!"


























