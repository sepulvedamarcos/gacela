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
  if [ -d "/var/lib/gacela" ]; then
    if [ -n "$(ls -A /var/lib/gacela)" ]; then
      echo "The directory '/var/lib/gacela' is not empty. Aborting."
      exit 1
    fi
  fi
}

#
# Remove the shared directory
#
remove_directory() {
  if [ -d "/var/lib/gacela" ]; then
    echo "Removing directory '/var/lib/gacela'..."
    if rm -r /var/lib/gacela; then
      echo "Directory '/var/lib/gacela' removed successfully."
    else
      echo "An error occurred: Could not remove the directory."
      exit 1
    fi
  else
    echo "Directory '/var/lib/gacela' does not exist. Skipping removal."
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
