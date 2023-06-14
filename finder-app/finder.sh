#!/bin/bash
# finder.sh
# 1st arg: a path to a directory, 2nd arg: search string
filesdir=$1 
searchstr=$2
echo "Directory and search string: ${filesdir} ${searchstr}"
#Exit with return value 1 error and print statements if filesdir and/or searchstr were not specified
if [ $# -ne 2 ]; then
	error="Missing Arguments"
	echo "${error}"
	exit 1
fi
#Exit with return value 1 error and print statements if filesdir does not represent a directory on the file system
if [ ! -d "$filesdir" ]; then
	printf "Error: $filesdir is not a directory on the file system \n"
        exit 1
#Find the number of files and matching lines. Print x and y
else
	x=$(find "$filesdir" -type f | wc -l)
        y=$(grep -R "$searchstr" "$filesdir" | wc -l)
        printf "The number of files are ${x} and the number of matching lines are ${y} \n"
	exit 0
fi

