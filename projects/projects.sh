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
