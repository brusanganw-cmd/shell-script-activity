#!/bin/bash
mkdir -p ~/secure_vault
echo "Welcome to keys.txt - Encryption keys stored here." > ~/secure_vault/keys.txt
echo "Welcome to secrets.txt - Confidential data stored here." > ~/secure_vault/secrets.txt
echo "Welcome to logs.txt - System logs stored here." > ~/secure_vault/logs.txt
echo "Files created successfully in ~/secure_vault."
ls -l ~/secure_vault

