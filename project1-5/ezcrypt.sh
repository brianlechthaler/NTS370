#Brian Lechthaler
#2/3/2019
#NTS370/Project 1.5
#
#EasyCrypt
#	Use OpenSSL to encrypt/decrypt files
#	with a user-defined password.
#
#Usage
#	ezcrypt.sh <input file> <-s>

#Define default values
CHOICE="1"

#Create user prompt and write input to CHOICE
echo "[0]Encrypt"
echo "[1]Decrypt"
read -n 1 CHOICE
echo "File: $1"

#If 0, Encrypt file
if [ "$CHOICE" -eq 0 ] ; then
#Indicate we're encrypting.
	echo "Ready to encrypt."
#Use OpenSSL to encrypt file.
	openssl enc -aes256 -e \
		-in "$1"\
		-out "$1.dat"
elif [ "$CHOICE" -eq 1 ]
then
#Indicate we're decrypting.
	echo "Ready to Decrypt."
#Use OpenSSL to decrypt file.
	openssl enc -aes256 -d \
		-in "$1.dat"\
		-out "$1"
fi

#Shred and delete file, if requested.
if [ "$2" = "-s" ] ; then
	echo "Warning: this will permanently overwrite the input file."
	echo "        This may take some time depending on system specs."
	shred -n 32 -z -u "$1"
else
	echo
fi