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
print "Enter path to input file\n(e.g. /etc/passwd)";
  my $inputfile = <STDIN>;
print "Enter path to output file\n(e.g. /tmp/out)";
  my $outputfile = <STDIN>;

chomp $inputfile;
chomp $outputfile;

#throw error if the file can't be read properly
open(my $fh, '<encoding(UTF-8)'), $inputfile) or die "Unable to open file '$inputfile' $!";

#check if $inputfile
if (-e $inputfile && -r $inputfile) {
  print "Input: $inputfile \n File exists and is readable.\nThese are not the droids you are looking for.";
} else {
  die "$inputfile does not exist or is not readable.";
}

while(my $line = <$fh>) {
  chomp $line;
  $line =~ "s/home\export/home";
  print "$line\n";
}
