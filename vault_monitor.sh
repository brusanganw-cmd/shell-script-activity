#!/bin/bash
VAULT_DIR="$HOME/secure_vault"
REPORT_FILE="./vault_report.txt"

if [ ! -d "$VAULT_DIR" ]; then
    echo "Vault not found."
    exit 1
fi

{
    echo "=== Vault Report ==="
    date
    echo

    for file in "$VAULT_DIR"/*; do
        fname=$(basename "$file")
        size=$(stat -c%s "$file")
        modified=$(stat -c%y "$file")
        perms=$(stat -c%A "$file")
        numeric_perms=$(stat -c%a "$file")

        echo "File: $fname"
        echo "Size: $size bytes"
        echo "Last Modified: $modified"
        echo "Permissions: $perms ($numeric_perms)"

        if [ "$numeric_perms" -gt 644 ]; then
            echo " SECURITY RISK DETECTED"
        fi

        echo "---------------------------"
    done
} > "$REPORT_FILE"

echo "Vault report generated at $REPORT_FILE"
