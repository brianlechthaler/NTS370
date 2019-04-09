echo "Would you like to Encrypt or Decrypt your file?"
echo "[0]Encrypt"
echo "[1]Decrypt"
read -n 1 CHOICE
echo $1

if [ "$CHOICE" -eq 0 ] ; then
	openssl enc -aes256 -e \
		-in $1\
		-out $1.dat\
elif [ "$CHOICE" -eq 1 ]
then
	openssl enc -aes256 -d \
		-in $1.dat\
		-out $1\
file
fi