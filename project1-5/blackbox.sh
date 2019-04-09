#!/bin/bash


#Project 1.5
#Codename "BlackBox"
#Mitigate log tampering by automatically creating
# a tarball containing cryptographically 
#signed logfiles found in LOGDIR.
#Disclaimer.
#Not suitable for production environments. 
#Vulnerability Notice. 
#Will be vulnerable to escalated filesystem priveleges as 
#KEYFILE is supposed to be an RSA private key with no password. 
#Possible Mitigation.
#encrypted filesystems such as EncFS, 
#HSMs such as the Yubico YubiHSM






#Check if /var/blackbox & /etc/blackbox exists
# and creates the directory if it doesn't
#test ! -d /var/blackbox && mkdir -p /var/blackbox
#test ! -d /etc/blackbox && mkdir -p /etc/blackbox

#Generate RSA keypair at /etc/blackbox if it's not already there. 
#The length of the key is 8192, so it may take a
# while to generate based on host configuration
#est ! -d /etc/blackbox/bbox_private && openssl genrsa -out /etc/blackbox/bbox_private 8192 
#test ! -d /etc/blackbox/bbox_public && openssl rsa -in /etc/blackbox/bbox_private -out /etc/blackbox/bbox_public

#Declare Variables.
INLOGDIR=/var/log
OUTLOGDIR=/var/blackbox
KEYFILE=/etc/blackbox/bbox_private
TAROUT=""

#Compress /var/log into a file, bbox_(month)(day of month)-year.tar. 
#Append a random number to it just in case the file
# already exists to lower the chance of accidental overwrites
tar -cvf "$OUTLOGDIR/bbox_$(date +%m-%d-%y).tar"\
 $INLOGDIR/

#Sign tarball with keypair
#and output detached signature for the tarball in the same dir 
openssl pkeyutl -sign \
-inkey $KEYFILE \
-in $TAROUT \
-out $OUTLOGDIR/bbox_$(date +%m-%d-%y).tar.sig