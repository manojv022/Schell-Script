### Free RAM Status Checking:

#!/bin/bash

FREE_SPACE=$( free -mt | grep "Total" | awk '{print $4}')
TH=9700

if [[ $FREE_SPACE -lt $TH ]]
then
        echo "WARNING, RAM is running low"
else
        echo "RAM is sufficient - $FREE_SPACE M"
fi

---------------------------------------------


### Archive files Bigger theen 20kb:

#!/bin/bash
#Revision:001$
#$tue sep 02 23:51 IST 2024$

#Variables
BASE=/home/manoj/tutorials/find_commands
DAYS=10
DEPTH=1
RUN=0

#Check if the directory is present or not
if [ ! _d $BASE ]
then
        echo "directory does not exist: $BASE"
        exit 1
fi

#Create 'archive' folder if not present
if [ ! -d $BASE/archive ]
then
        mkdir $BASE/archive
fi

#Find the list of files larget then +20K
for i in 'find $BASE -maxdepth $DEPTH -type f -size +20Mb'
do
        if [ $RUN -eq 0 ]
        then
                echo "[$(date "+Y_%m_%d %H:%M:%S")] archiving $i ==> $BASE/archive"
                gzip $i || exit 1
                mv $i.gz $BASE/archive || exit 1
        fi
done

-------------------------------------------------------------------



### User Add and password creation:



#!/bin/bash

# Check if the script is run as root
if [[ "${UID}" -ne 0 ]]; then
    echo 'Please run with sudo or as root.'
    exit 1
fi

# Ensure at least one argument (the username) is provided
if [[ "${#}" -lt 1 ]]; then
    echo "Usage: ${0} USER_NAME [COMMENT]..."
    echo 'Create a user with name USER_NAME and an optional COMMENT field.'
    exit 1
fi

USER_NAME="${1}"
shift
COMMENT="${@}"

# Generate a password based on the current date and time
PASSWORD=$(date +%s%N | sha256sum | head -c 12)

# Create the user with the provided comment
useradd -c "${COMMENT}" -m "${USER_NAME}"

if [[ $? -ne 0 ]]; then
    echo 'The account could not be created.'
    exit 1
fi

# Set the password for the user
echo "${USER_NAME}:${PASSWORD}" | chpasswd

if [[ $? -ne 0 ]]; then
    echo 'Password could not be set.'
    exit 1
fi

# Force password change on next login
passwd -e "${USER_NAME}"

echo
echo "Username: ${USER_NAME}"
echo
echo "Password: ${PASSWORD}"
echo
echo "Hostname: $(hostname)"


--------------------------------------------------------------------------------
