#!/bin/bash

# CIDR Menu Do Stuff Thingy

## features
# Get CIDRs...
# List Entities (set to array if needed)
# AWS
# Google
# Cloudflare
# Apple
# Microsoft
# Meta
# Facebook
# Instagram
# Snap
# get list of ipv4 and ipv6 cidrs individualally
# search for a cidr in all places

########################################################################################
# code for getting cidr info
# output all google cidrs
# curl -s https://www.gstatic.com/ipranges/goog.json | jq -r '.prefixes[] | .ipv4Prefix?, .ipv6Prefix? | select(. != null)'

# output ipv4 only google cidrs
# curl -s https://www.gstatic.com/ipranges/goog.json | jq -r '.prefixes[] | select(.ipv4Prefix != null) | .ipv4Prefix'

# output ipv6 only google cidrs
# curl -s https://www.gstatic.com/ipranges/goog.json | jq -r '.prefixes[] | select(.ipv6Prefix != null) | .ipv6Prefix'

# output ipv4 cloudflare cidrs
# curl https://www.cloudflare.com/ips-v4 | sort

# output ipv6 cloudflare cidrs
# curl https://www.cloudflare.com/ips-v6 | sort
########################################################################################

# Main Menu code block starts here
# menu items
menu_items=(
    "1: Get CIDRs..."
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
        while true; do
            opt01_entity_items=(
                "1: AWS"
                "2: Google"
                "3: Apple"
                "4: Microsoft"
                "5: Snap"
                "6: Facebook"
                "7: Insta"
                "8: Meta"
                "m: Main Menu"
                "x: Exit"
            )
            # print menu
            opt01_print_menu() {
                echo ""
                for item in "${opt01_entity_items[@]}"; do
                    echo "$item"
                done
                echo ""
            }

            # Entity options case menu
            opt01_print_menu
            read -rp "Option: " opt01_choice
            case $opt01_choice in
            1) # AWS
                # prompt ipv4, ipv6, or all - I bet this coiuld be a case block too for the menu instead of echos...
                echo "AWS was chosen."
                ;;
            2) # Google
                # TODO: add code for Google
                ;;
            3) # Apple
                # TODO: add code for Apple
                ;;
            4) # Microsoft
                # TODO: add code for Microsoft
                ;;
            5) # Snap
                # TODO: add code for Snap
                ;;
            6) # Facebook
                # TODO: add code for Facebook
                ;;
            7) # Insta
                # TODO: add code for Insta
                ;;
            8) # Meta
                # TODO: add code for Meta
                ;;
            m) # Back to main menu
                break
                ;;
            x) # Quit
                echo "Aborting script."
                echo ""
                exit 0
                ;;
            *) # catch-all
                echo "Invalid entry."
                echo ""
                ;;
            esac

            # prompt to go back to the main menu or quit
            while true; do
                read -rp "Return to menu or quit? (m/q): " back_or_quit
                echo ""
                case $back_or_quit in
                m) # Back to menu
                    break
                    ;;
                q) # Quit
                    echo "Aborting script."
                    echo ""
                    exit 0
                    ;;
                *) # catch-all
                    echo "Invalid entry."
                    echo ""
                    ;;
                esac
            done
        done
        ;;
    2) # Search CIDRs...
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
