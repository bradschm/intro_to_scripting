#!/bin/bash

# Script components
# Shebang: What should actually excute the program (#!/bin/bash or #!/bin/sh)
# A script is a text file that is also flagged as exectuable: (chmod +x script.sh)
# Execute the script: (./script.sh or path/to/script.sh)

# Logging - Examples of outputting text to a file and using a function
# Setting a constant (usually in all caps and does not change)
LOGFILE="pizza.log"

# Sample function for logging - takes a positional parameter, if a second was given, it would be assigned to $2 and so on.
# >> for outputing text from one command to a file (> overwrites , >> appends)
logthis() {
echo $(date '+%Y-%m-%d %H:%M:%S') "- $1" >> $LOGFILE
}

# Calling the function by name with a positional arguement
logthis "Welcome to the pizza timer!"

# Case - Making menus, checking input
# Case 1: Are you ready for pizza?
echo -n "Are you ready for pizza? [yes or no]: "
read proceed
case $proceed in

        [yY] | [yY][Ee][Ss] )
                echo "Let's proceed"
                logthis "Someone is ready for pizza!"
                ;;

        [nN] | [n|N][O|o] )
                echo "I see that you are not ready, please come back later.";
                logthis "The user is not ready for pizza"
                exit 1
                ;;
        *) echo "Invalid input"
            logthis "The user is not sure how to answer"
            exit 1
            ;;
esac

# Pauses the script so we can step through during the presentation
read -p "Pausing"

# Case 2: How many seconds should the pizza cook?
echo -n "How long does the pizza need to cook in seconds? "
read timer
case $timer in

    ''|*[!0-9]*)
    echo "Please enter a number, you entered: $time"
    logthis "A number was not entered, the value given was: $time"
    ;;

    * )
    echo "Setting timer for $timer seconds"
    logthis "Setting time for $timer seconds"
    ;;
esac

read -p "Pausing"


# For - Iterate over files or folders
# List all users on this computer to make sure the user has enough piza
for user in $(ls /Users/)
do
    echo "Make sure you have enough pizza for: $"
done

logthis "We found all these users: $(ls /Users/)"

# While - Do stuff until a condition or break happens
# Create a loop that ends when the time elapsed equals the amount of time requested

read -p "Pausing"

# Set our iteration variable to zero, this will be incremented by 1 each time we go through the while loop
time=0
while [ $time -lt $timer ]
do
    sleep 1
    # Increment our iteration variable
    ((time++))
    timeleft=$( echo $timer - $time | bc ) # Pipe is used to take the output of one command as an input to the next command
    echo -ne "\r\033[KTime until tasty pizza is ready: $timeleft"
    # \r Carriage return (brings cursor back to the beggining of the line
    # \033[K Clears the current line
done

logthis "Pizza is ready!"

# Make it look pretty
echo ""

read -p "Pausing"


# Until - Like while just flips the waiting
cowbells=5
until [  $cowbells -lt 1 ]; do
    echo $'\360\237\215\225' " Pizza is ready!!" $'\360\237\215\225'
    tput bel # makes a terminal sound
    sleep .5
    let cowbells-=1 # decrements the counter
done

read -p "Pausing"


# Function defined:
if_function() {
# If statements
# Let's see how long the pizza is cooking for and display a different message
if [ $timer -gt 15 ]
    then echo "Wow, you like a crispy pizza!"

else
    echo "Enjoy!"
fi
}

# Call a function
if_function

read -p "Pausing"

# One more for loop
for i in {1..200}
do
    echo -n $'\360\237\215\225' " "
done

echo ""

exit 0
