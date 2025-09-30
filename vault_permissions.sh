#!/bin/bash
if [ -d ~/secure_vault ]; then 
echo "Directory exist."
else 
echo "Error"
fi
cd ~/secure_vault
ls -l
read -p "Do you want to update permissions? (Yes/No): " answer
if [ "$answer" = yes ]; then 
echo "Updating the permissions ...."
read -p "Enter new permission to keys.txt: " perm1
read -p "Enter new permission to secrets.txt: " perm2
read -p "Enter new permission to logs.txt: " perm3
chmod $perm1 keys.txt
chmod $perm2 secrets.txt
chmod $perm3 logs.txt
else 
read -p "Press Enter to apply default permissions"
echo "Applying default permissions ..."
chmod 600 keys.txt
chmod 640 secrets.txt
chmod 544 logs.txt
echo "Permissions added successfully"
fi
ls -l  
