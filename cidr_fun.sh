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

# menu items array
menu_items=(
    "1: List CIDRs..."
    "2: Search CIDRs..."
    "x: Exit"
)
# function - print the menu
function print_primary_menu() {
    echo ""
    for item in "${menu_items[@]}"; do
        echo "$item"
        echo ""
    done
    echo ""
}
# function - now_what_prompt
function now_what_prompt() {
    while true; do
        read -rp "Main Menu or Exit? (m/x): " back_or_exit
        echo ""
        case $back_or_exit in
        m) # back to primary menu
            clear
            return 1
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
    done
}
# function - read user option
read_option() {
    # prompts >Option:< and sets variable
    read -rp "Option: " choice
    # drop down a line
    echo ""
    # menu options code block starts here
    case $choice in
    1)  # List CIDRs...
        while true; do # while loop of entities
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
                    echo ""
                done
                echo ""
            }
            clear
            echo ""
            # call opt01_print_menu function
            opt01_print_menu
            read -rp "Option: " opt01_choice # prompts >Option:< and sets variable
            echo ""
            # entity options case menu
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
                clear
                echo ""
                echo "##### Cloudflare #####"
                echo ""
                echo "##### IPv4 #####"
                curl -s https://www.cloudflare.com/ips-v4 | sort
                echo ""
                echo "##### IPv6 #####"
                curl -s https://www.cloudflare.com/ips-v6 | sort
                echo ""
                ;;
            m) # back to main menu
                clear
                echo ""
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
            # call now_what_prompt function to go back to the main menu or quit
            now_what_prompt
            result=$?
            if [ $result -eq 1 ]; then
                break
            fi
        done
        ;;
    2) # Search CIDRs...
        echo "This doesn't work yet."
        echo ""
        now_what_prompt
        # prompt for IP/CIDR
        # ask if menu or quit
        ;;
    x) # Exit
        echo ""
        exit 0
        ;;
    *) # catch-all
        echo "Invalid entry."
        echo ""
        now_what_prompt
        ;;
    esac
}
# loop for menu
while true; do
    print_primary_menu
    echo ""
    read_option
    echo ""
done