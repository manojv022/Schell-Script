### BASH Shell Script:

#vi <filename.sh> : to create a script file

# bash <file name>  : to run script

----------------------------------------

### 1. User Intrection :

#!/bin/bash
read -p "what is your name?" name
echo "your name is $name"



-----------------------------------------
### 2. Math Calculation:

#!/bin/bash

x=10
y=15

let mul=$x*$y
echo "$mul"

let sum=$x+$y
echo "$sum"
----------------
### 2nd Directly withput let command:


#!/bin/bash

x=10
y=15

echo "$(($x+$y))"

echo "$(($x*$y))"

echo "$(($x/$y))"

echo "$(($x-$y))"

----------------------------------------------------------------

### 3. Conditional Support:

#!/bin/bash

read -p "enter your marks: " marks

if [[ $marks -ge 80 ]]
then
        echo "1st devesion"
elif [[ $marks -ge 60 ]]

then
        echo "2nd devesion"
elif [[ $marks -ge 40 ]]
then
        echo "3rd devesion"

else
        echo "you are fail!!!!!!!!!!!!!!!!"
fi

--------------------------------------------------------------------------


### 4. 

