#!/bin/bash

# Function for User Account Management
function UserAccountManagement {

    # Account Creation
    if [ "$1" == "-c" ] || [ "$1" == "--create" ]; then
        read -p "Enter the username you want to create: " username
        userValidation=$(cat /etc/passwd | grep $username | wc -l)

        if [ $userValidation -gt 0 ]; then
            echo "User already exists."
            exit
        else
            echo "User does not exist. Creating the user: $username."
            useradd -m "$username" > /dev/null
            read -sp "Enter a password for user $username: " passwd
            echo -e "$passwd\n$passwd" | passwd "$username" > /dev/null
            echo "User created successfully."
            grep "$username" /etc/passwd
        fi

    # Account Deletion
    elif [ "$1" == "-d" ] || [ "$1" == "--delete" ]; then
        read -p "Enter the username you want to delete: " username
        userValidation=$(cat /etc/passwd | grep $username | wc -l)

        if [ $userValidation -gt 0 ]; then
            echo "User exists. Deleting the user: $username along with their home directory."
            userdel -r "$username"
        else
            echo "User does not exist."
            exit
        fi

    # Password Reset
    elif [ "$1" == "-r" ] || [ "$1" == "--reset" ]; then
        read -p "Enter the username for which you want to reset the password: " username
        userValidation=$(cat /etc/passwd | grep $username | wc -l)

        if [ $userValidation -gt 0 ]; then
            echo "User exists."
            read -sp "Enter a new password for user $username: " passwd
            echo -e "$passwd\n$passwd" | passwd "$username" > /dev/null
            echo "Password reset successfully."
        else
            echo "User does not exist."
            exit
        fi

    # List User Accounts
    elif [ "$1" == "-l" ] || [ "$1" == "--list" ]; then
        (echo -e "Username\tUser ID\tHome Directory"; awk -F ':' '{print $1, $3, $6}' /etc/passwd) | column -t

    # Help Option
    elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
        echo "User Account Management Script"
        echo "This script allows you to create, delete, list users, and reset user passwords."
        echo "Usage:"
        echo "  -c, --create    Create a new user account."
        echo "  -d, --delete    Delete an existing user account."
        echo "  -r, --reset     Reset the password of an existing user."
        echo "  -l, --list      List all available user accounts."
        echo "  -h, --help      Display this help message."

    # Invalid Option
    else
        echo "Invalid option. Please use -h or --help for guidance. Example: sh AccountCreation.sh -h or ./AccountCreation.sh -h"
    fi
}

# Calling the main function with the provided argument
UserAccountManagement "$1"
