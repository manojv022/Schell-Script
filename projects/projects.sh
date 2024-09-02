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
