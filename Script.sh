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
### 2nd Directly without let command:


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


### 4. Case input :

#!/bin/bash

echo "provide an option"
echo "a for print data"
echo "b for list of scripts"
echo "c to check the current location"

read choice

case $choice in
        a)date;;
        b)ls;;
        c)pwd;;
        *)echo "please provide a valid value"
esac

-----------------------------------------------------------------------------

### 5. Logical operations : AND(&&) operation

#!/bin/bash

#AND operation

read -p "what is your age? " age
read -p "your country:" country

        if [[ $age -ge 18 ]] && [[ $country == "india" ]]
        then
                echo "you can vote"
        else
                echo "you can't vote"
        fi
-------------------------------------------------------------------------------
        


### 6. FOR loop path store data:

#!/bin/bash

#getting values from a little file names.txt

FILE="/home/manoj/myscripts/names.txt"

for name in $(cat $FILE)
do
        echo "name is $name"
done
-----------------------------------------------------------------------------------------

### 7. While loop:
#!/bin/bash

count=0
num=10

while [[ $count -le $num ]]
do
        echo "value of count var is $count"
        let count++
done
-------------------------------------------------------------------------------------------


### 8. While loop iinfinete:

#!/bin/bash

#infinite loop
while true
do
        echo "hello everyone"
        sleep 2s
done

-----------------------------------------------------------------------------------------------


### 9. Function:

#!/bin/bash

#To make function
function welcomenote {
        echo "-----------------"
echo "welcome"
echo "--------------------"
}

#To call our function

welcomenote
welcomenote
welcomenote

----------------------------------------------------------------------------

### 10. 
