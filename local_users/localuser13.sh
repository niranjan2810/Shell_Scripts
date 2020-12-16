#!/bin/bash 


#eThis script displays the port listening on the system 
# This will be only displaying the ports that are for TCP4 

netstat -tuln ${1} | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}'


