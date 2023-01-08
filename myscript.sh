#!/bin/bash
# Filename: myscript.sh
# Author Shing Kwan Chow
# Date: 11 Nov 2022
# Comments:
# This shell script prompts users for inputs with options to manipulate
# user management, including user creation, deletion, group changes,
# shell change and account expiration.


# simple menus display function
display_menus(){
	echo 'A. Create User Account'
	echo 'B. Delete User Account'
	echo 'C. Change Supplementary Group for a User Account'
	echo 'D. Change Initial Group for a User Account'
	echo 'E. Change default login shell for a User Account'
	echo 'F. Change account expiration date for a User Account'
	echo 'Q. Quit'
}

# Function for user creation
function_A(){
	echo "Enter Username: "
	read username
	echo "Enter User Home Directory: "
	read directory
	echo "Enter the Default Login Shell: "
	read shell
	echo "$(sudo useradd -d $directory -s $shell -m $username)"
}

# Function for user deletion
function_B(){
	echo "Enter Username: "
	read username
	echo "$(sudo userdel -r $username)"
}

# Function for adding user to a supplementary group
function_C(){
	echo "Enter Username: "
	read username
	echo "Enter Group Name: "
	read group
	echo "$(sudo usermod -G $group $username)"
}

# Function for changing user inital group
function_D(){
	echo "Enter Username: "
	read username
	echo "Enter Group Name: "
	read group
	echo "$(sudo usermod -g $group $username)"
}

# Function for changing the default shell of user
function_E(){
	echo "Enter Username: "
	read username
	echo "Enter the Login Shell: "
	read shell
	echo  "$(sudo usermod -s $shell $username)"
}

# Function for changing user account expiration date
function_F(){
	echo "Enter Username: "
	read username
	echo "Enter the New Expiration Date: "
	read date
	echo  "$(sudo usermod -e $date $username)"
}

# clear the screen
echo "$(clear)"

# Print author information
echo "Program to Manage User Accounts"
echo "Author:		Shing Kwan Chow"
echo "Student Number:	041053874"
echo "Semester:		Fall 2022"
echo "Course - Section:	CST8102 - 313"
echo ""

# Initilizes variable
choice=z

# Loop while user does not quit the program
while [ $choice != 'Q' ] && [ $choice != 'q' ]
do
	# call display menus function
	display_menus
	# read user input
	echo ""
	echo "Please enter your choice: "
	read choice

	# if-else statement to determine which function to call
	if [ $choice = 'A' ] || [ $choice = 'a' ]
	then
		function_A
	elif [ $choice = 'B' ] || [ $choice = 'b' ]
	then
		function_B
	elif [ $choice = 'C' ] || [ $choice = 'c' ]
	then
		function_C
	elif [ $choice = 'D' ] || [ $choice = 'd' ]
	then
		function_D
	elif [ $choice = 'E' ] || [ $choice = 'e' ]
	then
		function_E
	elif [ $choice = 'F' ] || [ $choice = 'f' ]
	then
		function_F
	elif [ $choice = 'Q' ] || [ $choice = 'q' ]
	then
		echo "Quiting..."
		exit 0
	fi
	sleep 3

	#clear the screen
	echo "$(clear)"
done

# eof: myscript.sh
