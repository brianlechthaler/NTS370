#!/usr/bin/perl

#   Brian Lechthaler
#   04/03/19
#NTS370/G. Miles
#Assignment 2.3
#Purpose:
# -Build a simple script that reads a file (/etc/passwd)
# -Parse the file
# -Print the file

use strict;
use warnings;

#Prompt user for absolute paths to input and output files,
# store input in $inputfile and output in $outputfile
print " Enter an inputfile name: ";
  my $inputfile = <STDIN>;

print " Enter an outputfile name: ";
  my $outputfile = <STDIN>;

#clean up input string by popping off the newline character
chomp $inputfile;
chomp $outputfile;

#throw error if the file can't be read properly
open(my $fh, '<:encoding(UTF-8)',$inputfile) or die "Unable to open file '$inputfile' ";

#check if $inputfile exists, let user know if it doesn't
if (-e $inputfile && -r $inputfile) {
  print "Found $inputfile, exists and is readable...\r\n";
} else {
  die "$inputfile does not exist or is not readable...\r\n";
}

#read each line of input file and stop when we reach an EOF
while(my $line = <$fh> ) {
chomp $line;
$line =~ s/home/export\/home/;
print "$line\n";
}
