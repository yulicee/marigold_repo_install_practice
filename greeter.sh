#!/bin/bash

LOG_FILE="greeter_log.txt"

# Special users
SPECIAL_USERS=("Bob" "Amanda")

# Function to greet the user
greet_user() {
  if [[ " ${SPECIAL_USERS[@]} " =~ " $1 " ]]; then
    echo "Hello, $1! A great adventure lies ahead of you, enjoy the ride!"
  else
    echo "Hello, $1! Enjoy your stay!"
  fi

  # Log the greeting with timestamp
  echo "$(date '+%Y-%m-%d %T') - $1 was greeted" >> "$LOG_FILE"
}

echo "Welcome to the wonderful world of Linux!"

# Check if any arguments are provided
if [ $# -eq 0 ]; then
  # Prompt for unsernames
  echo "Enter the names of users (separated by space):"
  read -a usernames
fi

# Greet special users first
for username in "${SPECIAL_USERS[@]}"; do
  # Call the greet_user funciton
  greet_user "$username"
done

# Greet other users
for username in "${usernames[@]}"; do
  # Skip special users
  if [[ ! " ${SPECIAL_USERS[@]} " =~ "$username" ]]; then
    # Call the greet_user function
    greet_user "$username"
  fi
done

# End of script
