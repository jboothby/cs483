#!/bin/sh

# ensure the argument count is 2
if [ $# -ne 2 ]
then
  echo "usage: fkey keyword filename"
  exit
fi

# attempt to stat the file, then check stderr output for 'No such file'
# if that string exists more than 0 times, exit
exists=$(stat $2 2>&1 | egrep 'No such file' | wc -l)
if [ $exists -ne 0 ]
then
  echo "$2 does not exist"
  exit
fi

# print lines in testfile that have given string
egrep "$1" $2
