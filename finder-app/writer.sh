#!/bin/bash
#1st and 2nd variable
writefile=$1
writestr=$2
# Exit with value 1 error and print statements if any of the arguments above were not specified
if [ $# -ne 2 ]; then
    printf "%s" Missing Arguments
    exit 1
else
    #create a directory if it does not already exist
    mkdir -p "$(dirname $writefile)"
    #Creates a new file with name and path writefile with content writestr
    echo "$writestr" >> "$writefile"
    #Exits with value 1 and error print statement
    if [ ! -f "$writefile" ]; then
        error="Error: File could not be created" 
	printf "$error \n"
        exit 1
    fi
fi
