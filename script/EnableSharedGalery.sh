#!/bin/bash

# ==============================================================================
# Script: EnableSharedGallery.sh
# Description: This script configures the shared gallery for the application.
#              It creates a dedicated group and a shared directory, then sets
#              the necessary permissions for the folder and users.
# Author: sepulvedamarcos@gmail.com
# Version: 1.0
# ==============================================================================
# --- Functions ---
#
# Check whether the script is running as root
#
check_root() {
  if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root. Aborting."
    exit 1
  fi
}

#
# Show information about the directory to be created
#
display_info() {
  echo "The directory '/var/lib/gacela' will be created for the shared gallery."
  echo "Then a group named 'gacela-shared' will be created to manage gallery access."
  echo "If everything finishes correctly, you must log out so your session picks up the new group permissions."
}

#
# Create the gacela-shared group and add users
#
create_group_and_add_users() {
    if getent group gacela-shared >/dev/null; then
        echo "Group 'gacela-shared' already exists. Skipping creation."
    else
        echo "Creating group '$GROUP_GACELA'"
        if groupadd gacela-shared; then
            echo "Group 'gacela-shared' created successfully."
        else
            echo "An error occurred: Could not create group '$GROUP_GACELA'."
            exit 1
        fi
    fi

    echo "Adding regular users to group 'gacela-shared'"
    
    # Get a list of regular users (UID >= 1000 and with a login shell)
    mapfile -t users < <(getent passwd | awk -F: '$3 >= 1000 && $7 ~ /bash|sh|zsh/ {print $1}')

    if [ ${#users[@]} -eq 0 ]; then
        echo "No new users were added to the group."
        return
    fi
    
    for user in "${users[@]}"; do
        if ! groups "$user" | grep -q '\bgacela-shared\b'; then
            echo "Adding user '$user' to group 'gacela-shared'"
            if usermod -aG gacela-shared "$user"; then
                echo "User '$user' added."
            else
                echo "An error occurred: Could not add user '$user' to the group."
            fi
        else
            echo "User '$user' already belongs to group 'gacela-shared'."
        fi
    done

    echo "Users added to the group."
}

#
# Create the directory and set permissions
#
create_directory_and_set_permissions() {
  if [ ! -d "/var/lib/gacela" ]; then
    echo "Creating directory '/var/lib/gacela'"
    if mkdir -p /var/lib/gacela; then
      echo "Directory '/var/lib/gacela' created successfully."
    else
      echo "An error occurred: Could not create the directory."
      exit 1
    fi
  fi
  
  echo "Setting owner and permissions..."
  if chown -R root:gacela-shared /var/lib/gacela && \
     chmod -R 2775 /var/lib/gacela; then
    echo "Permissions set for directory '/var/lib/gacela'."
  else
    echo "An error occurred: Could not set permissions."
    exit 1
  fi
}

#
# Create and delete a test file to verify permissions
#
test_permissions() {
    echo "Running permissions test..."
    local test_file="/var/lib/gacela/test.txt"
    
    if touch "$test_file"; then
        echo "Test file created successfully."
    else
        echo "An error occurred: Could not create the test file."
        exit 1
    fi

    if echo "This is a test" > "$test_file"; then
        echo "Test file write successful."
    else
        echo "An error occurred: Could not write to the test file."
        exit 1
    fi

    if rm "$test_file"; then
        echo "Test file removed successfully."
    else
        echo "An error occurred: Could not remove the test file."
        exit 1
    fi
}


# --- Main Function ---

main() {
  check_root
  display_info
  create_group_and_add_users
  create_directory_and_set_permissions
  test_permissions
  echo "Shared gallery configuration finished successfully."
}

# --- Run Script ---
main "$@"
