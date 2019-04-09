#!/usr/bin/perl
###########################
#NTS370/G. Miles
#Assignment 2.1
#Purpose:
# Cement knowledge of perl scripting by writing a simple script
###########################

#print:   write value to console STDOUT
#chomp:   removes newlines (\n) if present
#chop:    removes last character of string (ex: 1234 -> 123)

#Print start banner
print  "***NTS370 Project 2.1***\n";

#Prompt user for input
print  "-->Enter string to be trimmed:\n";
$character_input = <STDIN>;

#remove new lines, then remove last character of line.
#print result when done
#rinse, repeat
chomp $character_input;
chop $character_input;
print "$character_input\n";
chomp $character_input;
chop $character_input;
print "$character_input\n";
chomp $character_input;
chop $character_input;
print "$character_input\n";
chomp $character_input;
chop $character_input;
print "$character_input\n";
chomp $character_input;
chop $character_input;
print "$character_input\n";
chomp $character_input;
chop $character_input;
print "$character_input\n";
