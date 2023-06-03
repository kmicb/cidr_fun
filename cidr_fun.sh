#!/bin/bash

# CIDR Menu Do Stuff Thingy

## features
# output long cidrs into table format?

########################################################################################
# output ipv4 only google cidrs
# curl -s https://www.gstatic.com/ipranges/goog.json | jq -r '.prefixes[] | select(.ipv4Prefix != null) | .ipv4Prefix'

# output ipv6 only google cidrs
# curl -s https://www.gstatic.com/ipranges/goog.json | jq -r '.prefixes[] | select(.ipv6Prefix != null) | .ipv6Prefix'
########################################################################################

# clear screen
clear

# drop down a line
echo ""

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
                "9: Cloudflare"
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
            echo ""
            case $opt01_choice in
            1) # aws
                # prompt ipv4, ipv6, or all - I bet this coiuld be a case block too for the menu instead of echos...
                echo "AWS was chosen."
                echo ""
                ;;
            2) # google
                echo "Google"
                echo ""
                curl -s https://www.gstatic.com/ipranges/goog.json | jq -r '.prefixes[] | .ipv4Prefix?, .ipv6Prefix? | select(. != null)'
                echo ""
                ;;
            3) # apple
                echo "Apple"
                echo ""
                ;;
            4) # microsoft
                echo "Microsoft"
                echo ""
                ;;
            5) # snap
                echo "Snap"
                echo ""
                ;;
            6) # facebook
                echo "Facebook"
                echo ""
                ;;
            7) # insta
                echo "Instagram"
                echo ""
                ;;
            8) # meta
                echo "Meta"
                echo ""
                ;;
            9) # cloudflare
                echo "##### Cloudflare #####"
                echo ""
                echo "IPv4"
                curl -s https://www.cloudflare.com/ips-v4 | sort
                echo ""
                echo "IPv6"
                curl -s https://www.cloudflare.com/ips-v6 | sort
                echo ""
                ;;
            m) # back to main menu
                break
                ;;
            x) # quit
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
                read -rp "Main Menu or Quit? (m/q): " back_or_quit
                echo ""
                case $back_or_quit in
                m) # back to main menu
                    clear
                    break
                    ;;
                q) # quit
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
        echo ""
        exit 0
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