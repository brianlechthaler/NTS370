
#!/bin/bash
#Final Project
#  Brian Lechthaler
#  04/20/19
#  NTS370@UAT (feat G. Miles)

#ASCII art makes everything better

echo "----------------------------------------"
echo "   __  __          __      __           "
echo "  / / / /___  ____/ /___ _/ /____  _____"
echo " / / / / __ \/ __  / __ `/ __/ _ \/ ___/"
echo "/ /_/ / /_/ / /_/ / /_/ / /_/  __/ /    "
echo "\____/ .___/\__,_/\__,_/\__/\___/_/  v1 "
echo "    /_/                                 "
echo "   Updater Script by Brian Lechthaler   "
echo "----------------------------------------"

#Ask uname if we're on Linux
platform=$(uname)

if [ $platform = "Linux" ]
then 
    echo "INFO: You are running Linux. This script is designed to work here."
else
    echo "ERROR: It looks like you aren't running this script on Linux. This script wont work here."
fi

#Declare config directory variables
confDIR=$1/update.conf
pwdCONF=$PWD/update.conf


if [ -s $confDIR ]
then
    source $confDIR
    echo "INFO: Loaded config from $confDIR"
    echo "Config Options:"
    cat $confDIR | grep -v "#"
elif [ -s $pwdCONF ]
then
    source $pwdCONF
    echo "INFO: Loaded config from $pwdCONF"
    echo "Config Options:"
    cat $pwdCONF | grep -v "#"
else 
    "ERROR: No config files found."
fi



if [ $useAPT == 'yes' ]
then
    sudo apt update
    sudo apt full-upgrade -y
else
    echo
fi

if [ $useAPT == 'no' ]
then
    echo "INFO: Skipping apt updates/upgrades."
    echo "Did you set useAPT=yes in the config?"
fi

tmpDIR="/tmp/mnangel-clustergit_$RANDOM"
mkdir -p $tmpDIR
if [ useGIT == 'yes' ]
then
    echo "Before we start, we have to clone an external script."
    git clone --recursive https://github.com/mnagel/clustergit.git $tmpDIR
    cd $gitDIR
    /bin/bash ./$tmpDIR/clustergit 
fi
    
if [ $useGIT == 'no' ]
then
    echo "INFO: Skipping GIT updates/upgrades."
    echo "Did you set useGIT=yes in the config?"
fi
