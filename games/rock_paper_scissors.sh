#!/bin/bash

# Rock-paper-scissors game with animation for player and CPU choices

#############################
# Function to display animation
#############################

loading_anim(){
    local symbols="/ - \\ |"
    for i in {1..3}; do
        for symbol in $symbols; do
            printf "\r$symbol"
            sleep 0.1
        done
    done
}


#############################
# Read input from user (rR,pP,sS) and store to variable
# Loop back if player inputs invalid choice
#############################

player_choice=""

while [[ ! "$player_choice" =~ ^[rpsRPS]$ ]]; do
    echo "[r]ock, [p]aper, or [s]cissors?"
    read player_choice

    case $player_choice in  
        r|R)
            player_choice="rock"
            break
            ;;
        p|P)
            player_choice="paper"
            break
            ;;
        s|S)
            player_choice="scissors"
            break
            ;;
        *)
            echo "invalid choice, try again"
            ;;
    esac
done


#############################
# Generate CPU choice
# Generate a random number between 0 and 2 to represent cpu choice
# Convert number to string
#############################

cpu_choice_num="$((RANDOM % 3))"
    case $cpu_choice_num in
    0) 
        cpu_choice="rock"
        ;;
    1) 
        cpu_choice="paper"
        ;;
    2) 
        cpu_choice="scissors"
        ;;
    esac


#############################
# Display animation and choices
#############################

# Display player choice
loading_anim
echo "you: $player_choice"

# Display CPU choice
loading_anim
echo "cpu: $cpu_choice"

#############################
# Compare player choice to cpu choice and display outcome
#############################

case "$player_choice$cpu_choice" in
    rockrock | paperpaper | scissorsscissors)
        loading_anim
        echo "tie!";;
    rockpaper | paperscissors | scissorsrock)
        loading_anim
        echo "you lose!";;
    rockscissors | paperrock | scissorspaper)
        loading_anim
        echo "you win!";;
esac