#!/bin/bash 

VAULT_DIR="$HOME/secure_vault"
REPORT_FILE="$VAULT_DIR/vault_report.txt"

if [ ! -d "$VAULT_DIR" ]; then
	echo "ERROR: Directory '$VAULT_DIR' not found. please run vault_setup.sh First"
	exit 1

fi

echo "--- Vauly Security report ---" > "$REPORT_FILE"
echo "Generated on: $(date)" >> "$REPORT_FILE"
echo "-----------------------" >> "$REPORT_FILE"

for file in "$VAULT_DIR"/*; do
	if [ -f "$file" ]; then
		file_name=$(basename "$file")
		size_bytes=$(stat -c %s "$file")
		last_modifies=$(stat -c %y "$file")
		permissions_octal=$(stat -c %a "$file")

		echo "File Name: $file_name" >> "$REPORT_FILE"
		echo "Size bytes: $size_bytes" >> "$REPORT_FILE"
		echo "Last Modified: $last_modified" >> "$REPORT_FILE"
		echo "Permissions: $permissions_octal" >> "$REPORT_FILE"

		if [ "$permissions_octal" -gt 644 ]; then
			echo "SECURITY RISK DETECTED: Permissions are too open!" >> "$REPORT_FILE"

		fi

		echo "-----------------------------------------" >> "$REPORT_FILE"

	fi
done

echo "Vault monitoring complete"
echo "Report has been generated at '$REPORT_FILE'"
