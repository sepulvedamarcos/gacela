#!/bin/bash

# ==============================================================================
# Script: DisableSharedGallery.sh
# Description: This script removes the group and the shared folder
#              for the application, only if the folder is empty.
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
# Verify that the shared directory is empty
#
check_directory_empty() {
  if [ -d "/home/.gacela-shared" ]; then
    if [ -n "$(ls -A /home/.gacela-shared)" ]; then
      echo "The directory '/home/.gacela-shared' is not empty. Aborting."
      exit 1
    fi
  fi
}

#
# Remove the shared directory
#
remove_directory() {
  if [ -d "/home/.gacela-shared" ]; then
    echo "Removing directory '/home/.gacela-shared'..."
    if rm -r /home/.gacela-shared; then
      echo "Directory '/home/.gacela-shared' removed successfully."
    else
      echo "An error occurred: Could not remove the directory."
      exit 1
    fi
  else
    echo "Directory '/home/.gacela-shared' does not exist. Skipping removal."
  fi
}

#
# Remove the group
#
remove_group() {
  if getent group gacela-shared >/dev/null; then
    echo "Removing group 'gacela-shared'..."
    if groupdel gacela-shared; then
      echo "Group 'gacela-shared' removed successfully."
    else
      echo "An error occurred: Could not remove the group."
      exit 1
    fi
  else
    echo "Group 'gacela-shared' does not exist. Skipping removal."
  fi
}

# --- Main Function ---

main() {
  check_root
  check_directory_empty
  remove_directory
  remove_group
  echo "Shared gallery configuration has been disabled successfully."
}

# --- Run Script ---
main "$@"
