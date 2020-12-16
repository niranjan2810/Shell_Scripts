#!/bin/bash 

# This script is to show Input Output redirection 

# Redirecting standard output to a file 

File="/tmp/output"

head -n2 /etc/passwd > ${File}

# Redirecting standard input from a file

read line < ${File}
echo "First line of the file is : ${line}"

# Redirecting standard output to a file using >> i.e. not over writting 

head -n2 /etc/passwd >> ${File}

# If this file is now read using echo command, it will have output of the above command added to it 

echo 'The output of the file when file is not overwritten i.e. appended : '
cat ${File}

# If the std output is appended to the file (use >>)

echo 'This is 1st line' >> appended_file.txt 
echo 'This is 2nd line' >> appended_file.txt 

# If we want to save the std error into any file then we have to use 2 which is std operator of std error 
# If 2> is specified that means std error out of all the output will be redirected 

head -n2 /etc/passwd /etc/fake_file 2> error.txt 	# This will redirect the std error out of the total output to error.txt file
# As there is nothing specified for where to show the std output it will be default shown on the terminal

# If we want to redirect both std output and error to file or terminal we use following command 

head -n2 /etc/passwd /etc/fake_file &> output_and_error.txt 

# If we want to redirect both std output and error to another command then it is used like below 

head -n2 /etc/passwd /etc/fake_file |& cat -n		# Std output and error is sent to cat command (n option will show line numbers)


# Thus REDIRECTION of OUTPUT OR ERROR we use 1> or 2> respectively. For REDIRECTION of both &> is used 
# And finally for PIPING both OUTPUT and ERROR |& is used
# When only | is used for piping, only OUTPUT is sent to appended command

echo "This is std error" >&2 				# This will store the string into std error i.e. std error of this sh file is that
							# Thus if std error of this file sent to any file this string will be stored in it.
# We can discard output and error following way :

head -n2 /etc/passwd /etc/fake_file &> /dev/null	# Will send the output to the file /dev/null (Null device)
