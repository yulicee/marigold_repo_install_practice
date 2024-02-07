#!/bin/bash

# Define the path for the log file
LOG_FILE="./greeter_log.txt"

# Arrays to store different types of users
USERNAMES=()   # Array to store all usernames
SPECIAL=()     # Array to store special users
NORMAL=()    # Array to store ordinary users

# Define special users
SPECIAL_USERS=("Bob" "Amanda")

# Function to greet the user
greet_user() {
  # Check if the user is in the list of special users
  if [[ " ${SPECIAL_USERS[@]} " =~ " $1 " ]]; then
    SPECIAL+=("${1}")   # Add the user to the special users array
  else
    NORMAL+=("${1}")  # Add the user to the ordinary users array
  fi

  # Log the greeting with timestamp
  echo "$(date '+%Y-%m-%d %T') - $1 was greeted" >>"$LOG_FILE"
}

echo "Welcome to the wonderful world of Linux!"

# Check if any arguments are provided
if [ $# -eq 0 ]; then
  # Prompt for usernames if no arguments are provided
  echo "Enter the names of users (separated by space):"
  read -a USERNAMES
else
  USERNAMES=("$@")  # Use provided arguments as usernames
fi

# Iterate through the list of usernames and greet each user
for username in "${USERNAMES[@]}"; do
  greet_user "$username"
done

# Greet special users differently
for user in "${SPECIAL[@]}"; do
  echo "Hello, ${user}! A great adventure lies ahead of you, enjoy the ride!"
done

# Greet ordinary users
for user in "${NORMAL[@]}"; do
  echo "Hello, ${user}!"
done

# End of script
