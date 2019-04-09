#!/bin/bash

##NTS370 Project 1.2 -- Parsing
##Brian Lechthaler
##1-31-2019



##Set our output file to --current directory/parser_output.txt--
OUTPUT="$PWD/parser_output.txt"

##/etc/passwd is a list of users and their respective information where every row is a seperate user. Inside these rows-- separated by ':' are 7 different values.
##As an example of this, here's my personal user account on a VM I use for this class...
##"brianlechthaler:x:1000:1000:Linux User,,,:/home/brianlechthaler:/bin/ash"
##The first column is the username, second is a password --in most cases this is just a pointer to /etc/shadow where the actual password hash is stored--, third a User ID,and fourth a Group ID. The fifth variable is an optional comment field for info about the user, and the sixth is the home directory, followed by the final 7th variable, the shell/command to run at login.
##Here's a list to recap...
##1. Username
##2. Pointer to password hash in /etc/shadow
##3. User ID
##4. Group ID
##5. User ID info --field for comments
##6. Home Directory, absolute path
##7. Shell, absolute path


##So, using awk, we will set the delimiter to ':' and tell it to print the first value using 'print $1' before that delimiter--in this case the username. Then, we sort the list alphabetically using sort and write it to our file. 
echo "Usernames:"
awk -F':' '{print $1}' /etc/passwd | sort >> $OUTPUT

##Now we will repeat the same steps, and replace $1 with $(row number). Because we're looking for the Home Directory, we will go ahead and change $1 to $6, as it is the 6th column.
echo "Home Directories:" >> $OUTPUT
awk -F':' '{print $6}' /etc/passwd  >> $OUTPUT

##Finally, let's grab the command/shell for the user. Just as before, we take the row number we want--in this case 7--and write it to the output file.
echo "Home Directories:" >> $OUTPUT
awk -F':' '{print $7}' /etc/passwd  >> $OUTPUT
