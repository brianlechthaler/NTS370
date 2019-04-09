#!/usr/bin/perl

# Project 2.2 : File Dump
# NTS370/G.Miles
# Brian Lechthaler
# 03/13/19

# Purpose of assignment: Write a program prompting user for a file,
# then dump contents of that file to STDOUT.


#Prompt user for input file and print the name of that file to STDOUT
print "What file would you like to read?\n";
print "--> Type in name of file and press enter\n";
#$fileName = <STDIN>;
#Print example input filename
print "--> Ex: proj22a.pl\n";
print " File selection: $fileName\n";

#Open and print the contents of the file
#Rinse and repeat. Loop until ^C or PID of interpreter gets killed
open(NAME,<STDIN>);
while (<fileName>) {
  chomp $fileName;
  print $_;
}

print " Here are the contents of your file:\n";
#print "------------------------------------\n";

#prompt user for filename input and print contents
print "Enter a filename:";
open (fileName,<STDIN>);
print "Here are your file contents";
print "------------------------------------\n";
while (<fileName>) {
  chomp $fileName
  print $_;
}
