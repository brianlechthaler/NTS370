#!/bin/bash

OUTPUT="$PWD/parser_output.txt"

echo "Usernames:" >> $OUTPUT
awk -F':' '{print $1}' /etc/passwd | sort >> $OUTPUT

echo "Home Directories:" >> $OUTPUT
awk -F':' '{print $6}' /etc/passwd  >> $OUTPUT

echo "Command/shell:" >> $OUTPUT
awk -F':' '{print $7}' /etc/passwd  >> $OUTPUT
