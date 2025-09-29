#!/bin/bash
# vault_permissions.sh

VAULT_DIR="shell-script-activity/assignment/secure_vault"

# 1. Check if secure_vault exists
if [ ! -d "$VAULT_DIR" ]; then
    echo "Error: secure_vault directory does not exist. Run vault_setup.sh first."
    exit 1
fi

# 2. Function to update permissions for a single file
update_permission() {
    local file=$1
    local default_perm=$2

    echo "------------------------------------------"
    echo "Current permissions for $file:"
    ls -l "$VAULT_DIR/$file"

    # Ask user if they want to update
    read -p "Do you want to update permissions for $file? (y/n): " answer

    if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
        read -p "Enter new permission (e.g., 600) or press Enter for default [$default_perm]: " new_perm

        if [ -z "$new_perm" ]; then
            chmod "$default_perm" "$VAULT_DIR/$file"
            echo " Default permission $default_perm applied to $file"
        else
            chmod "$new_perm" "$VAULT_DIR/$file"
            echo " Custom permission $new_perm applied to $file"
        fi
    else
        echo "Skipping $file..."
    fi
}

# 3. Call the function for each file with appropriate defaults
update_permission "keys.txt" 600
update_permission "secrets.txt" 640
update_permission "logs.txt" 644

# 4. Show final permissions
echo "------------------------------------------"
echo "Final file permissions:"
ls -l "$VAULT_DIR"
