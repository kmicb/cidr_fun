#!/bin/bash

# CIDR Menu Do Stuff Thingy

## features
#
# get list of all cidrs
# get list of ipv4 and ipv6 only cidrs
# for aws - too much info - just grab ipv4/6
# search for a cidr in all places

# Main Menu code block starts here
# menu items
menu_items=(
    "1: List CIDRs..."
    "2: Search CIDRs..."
    "9: Exit"
)

# print the menu
print_menu() {
    echo ""
    for item in "${menu_items[@]}"; do
        echo "$item"
        echo ""
    done
    echo ""
}

# case block
# Function to read user option
read_option() {
    read -rp "Option: " choice
    echo ""
    case $choice in
    1) # List CIDRs...
        # prompt aws, google, apple, microsoft, etc
        # prompt ipv4 or ipv6 or all
        # display items
        # ask if menu or quit
        ;;
    2)  # Search CIDRs...
        # prompt for IP/CIDR
        # go out and find info
        # display info
        # ask if menu or quit
        ;;
    9) # Exit
        echo "Aborting script."
        echo ""
        ;;
    *) # catch-all
        echo "Invalid entry."
        echo ""
        ;;
    esac
}

# loop for menu
while true; do
    print_menu
    echo ""
    read_option
    echo ""
done