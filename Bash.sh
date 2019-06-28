# 1. Basics
# Command line interpreter
#! /bin/bash

#echo "Hello World!!"


2. Comments and Variables
# This is a comment

echoing system variables(begins with Caps)
echo "$BASH"

Variable names cannot start with a number
#1=Shravan
echo The name is $1

3. Read User Input
echo "enter name: "
read name
echo "entered name:$name"
read 'username': name fame game
echo "entered values are: $name $fame $game"


read -sp 'password': pass_var
echo "password: $pass_var"

To enter multiple inputs and save them inside an array use -a flag
echo "Enter names:"
read -a names
echo "Name: ${names[0]}, ${names[1]}, ${names[2]}"

if you do not enter any variable name to read values, by default the values entered will be stored in the system variable "REPLY"
read -p 'enter value:'
echo "$REPLY"

#Passing arguments to Bash Script
echo "Provided args: $1 $2 $3"
echo "You provided the args:$@"

echo "you provided the args:$@"
args=("$@")
echo ${args[0]} ${args[1]} ${args[2]} ${args[3]}

# display number of args passed to bash script
echo $#

# if statement
echo 'enter values': 
read name
read fame
read -p 'enter value': i 
if [ "$i" -eq  0 ]
then
echo "number is zero"
elif [ "$i" -le 0 ]
then
echo "number is negative"
else
echo "number is positive"
fi 

# File test operators

echo -e "Enter the name of the file: \c"
device="S:\Operating Systems\Cent OS\CentOS-7-x86_64-Everything-1804"
if [ -b "$device" ]
then
echo "The $device found"
else
echo "The $device not found"
fi

# Append output to the end of text file

echo -e "Enter the name of the file:\c"
read file_name
if [ -f $file_name ]
then
if [ -w $file_name ]
then
echo "Append me"
cat >> $file_name
else
echo "The file does not have write permissions "
fi
else
echo "the $file_name does not exists"
fi

# To give read, write and executable permissions to files use the below command
 chmod +rwx filename
# To remove read, write and executable permissions to files use the below command
 chmod -rwx filename 


# Logical AND and OR operator with if statements

Replace && with ||

read -p 'enter age': age
if [ $age -ge 18 ] && [ $age -lt 30 ]
if [[ $age -ge 18  &&  $age -lt 30 ]]
if [ $age -ge 18 -a $age -lt 30 ]
then
echo "valid age"
else
echo "not valid age"
fi

# Perform Arithmetic operations

i=20
j=10
echo $(( i + j ))
echo $(( i - j ))
echo $(( i * j ))
echo $(( i / j ))
echo $(( i % j ))
# or you could use below
echo $( expr $i + $j )
echo $( expr $i - $j )
echo $( expr $i \* $j )
echo $( expr $i / $j )
echo $( expr $i % $j )


# Perform arithmetic operations on floating point numbers using bc command
i=20.5
j=5
echo "scale=2;$i / $j" | bc

# Case statement
read -p 'Enter the vehicle type': name
case $name in
	"car" )
	      echo "Rent of $name is 250$";;
	"bike" )
	      echo "Rent of $name is 50$";;
	"RV" )
	      echo "Rent of $name is 1000$";;
	* )
	      echo "vehicle is unknown";;
esac


# Case statement evaluation using patterns
read -p 'enter some character:' value
case $value in 
	[a-z] )
		echo "User entered $value in a-z";;
	[A-Z] ) 
		echo "User entered $value in A-Z";;
	[0-9] )
		echo "User entered $value in 0-9";;
	? )
		echo "User entered $value in special character";;
	* ) 
	        echo "unknown input";;
esac

# Declaration of Array( Bash support 1-D)
os=('ubuntu' 'windows' 'redhat' 'linux')
echo "${os[@]}"
echo "${#os[@]}"
echo "${#os[0]}"
os[4]='mac'
os[5]='donald'
echo ${os[@]}

unset os[4] os[5]
unset os[5]
echo ${os[@]}

string=variable
echo ${string[@]}
echo ${string[0]}
echo ${#string[@]}

# While loops

i=8
while [ $i -le  10 ]
do
echo "$i"
i=$(( i+1 ))
((i++))
sleep 1
gnome &
done

# Read a file content in Bash

1. Input redirection
while read p 
do
echo $p
done < monkey.txt

2. Pipe symbol
cat monkey.txt | while read p
do 
echo $p
done

3. For Special Characters use line feed seperator

while IFS= read -r line
do
echo $line
done < /etc/hosts

4. For Loop demo

Syntax 1
for var in 1 2 3 4 5 .. N
do
echo "$var"
done

Syntax 2
for var in {1..5}
do
echo "$var"
done

Syntax 3
or var in {1..10..2}
o
echo $var
#one

echo ${BASH_VERSION}

# Syntax 4
for ((i=0;i<5;i++))
do
echo $i
done

# Use For loop to execute commands

or command in ls pwd date
#o
cho $command
done

# Type 2

for command in ls pwd date
do
echo "----------------$command---------------"
$command
done

# Type 3

for item in *
do
 if [ -f $item ]
 then
  echo $item
 fi
done


# SELECT LOOP
 Select construct allows us to generate easy menus

select var in mark ben ten mike
do
 echo "$var selected"
done

# select loop is often used with case statement
select name in mark ben mike ten
do
 case $name in
 mark )
  echo "Mark selected";;
 ben )
  echo "Ben selected";;
 mike )
  echo "mike selected";;
 ten )
  echo "ten selected";;
 * )
  echo "error";;
esac
done

for (( i=1 ; i < 10; i++ ))
do
if [ $i -gt 8 ]
then
break
fi
if [ $i -eq 2 -o $i -eq 3 -o $i -eq 4 ]
then
continue
fi
echo $i
done


# Function Demo
 Type 1
function Hello(){
echo "Hello Universe"
}

quit(){
echo "exiting . . ."
}

echo "I am the First line. . ."
Hello
echo "I am the last line . . . "
quit
echo "I am what I am"

# Type 2 Passing args to function

function print(){
 echo $1 $2 $3
}

quit(){
 exit
}

 print Hello I gr8

 Global and Local Variables

 Global Variable
function print(){
name=$1
echo "The name is $name"
}
name="TOM"
echo "The name is $name"
print MAX

 Local Variable
function print(){
local name=$1
echo "The name is $name"
}

name="TOM"
echo "The name is $name"
print MAX


# Function Example

usage() {
 echo "you need to provide an argument: "
 echo "usage : $0 file_name"
}

is_file_exists() {
    local file="$1"
    [[ -f "$file" ]] && return 0 || 1
}

[[ $# -eq 0 ]] && usage

if (is_file_exists "$1")
then
 echo "File Found"
else
 echo "File not found"
fi


 READ ONLY command
 Readonly variables demo
readonly var=31
echo "$var"
var=30
echo "$var"

# Readonly functions demo

hello(){
  echo "How are you"
}

hello

readonly -f hello


hello2(){
  echo "I am gr8"
}

readonly -f hello2

hello
hello2

readonly -f
readonly -p


# SIGNALS & TRAPS

echo "pid is $$"
while (( COUNT < 10  ))
do
 sleep 2
 (( COUNT++ ))
 echo $COUNT
done
exit 0

#TRAP
 e.g 1
trap "echo exit command in detected" 0
echo "Hello world"
exit 0 # exit 0 is a success signal

# e.g 2

file=/c/Users/SHRAVAN-ADMIN/Documents/Bash/random.txt
trap "rm -f $file"  SIGKINT  

echo "pid is $$"
while (( COUNT < 10  ))
do
 sleep 2
 (( COUNT++ ))
 echo $COUNT
done
exit 0



# Debug a Bash Script

-x script name

inside the script
-x (start of debugging)
x (stop debugging)









