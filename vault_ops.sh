#!/bin/bash
while true; do 
echo "================================"
echo "SECRET MANAGEMENT SYSTEM"
echo "=============================="
echo "1.Add secret"
echo "2.update secret" 
echo "3. Add Log  entry"
echo "4.Access keys "
echo "5.Exit"
echo "===================="
read -p "Select an option(1-5): " choice
case $choice in 
1)
   read -p "Enter new secret: " secret 
   echo  "$secret" >> secrets.txt
   echo "Secret added successfuly"
   echo 
   ;;
2) 
   read -p "Enter text to find: " old_text
   read -p "Enter replacement text: " new_text
   if grep -q "$old_text" secrets.txt 2>/dev/null; then
      sed -i "s/$old_text/$new_text/g" secrets.txt
      echo "Secret update successfully"
   else
      echo "No match found"
   fi 
   echo  
   ;;
3) 
   read -p  "Enter log message:" log_msg
   timestamp=$(date "+%Y-%m-%d %H:%M:%S") >> log.txt
   echo " Log entry added" 
   echo 
   ;;
4)
   echo "ACCESS DENIED"
   echo 
   ;;
5)
   echo "Exiting Secret Management System "
   exit 0
   ;;
*)
   echo "Invalid option. Please select 1-5."
   echo 
   ;;
  esac
done
