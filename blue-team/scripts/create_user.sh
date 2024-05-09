#!/usr/bin/bash

regex=1234567890abcdefghijklmnopqrstuvxwyzABCDEFGHIJKLMNOPQRSTUVXWYZ
input=input.txt

function create_user(){
			while read -r line
			do
				echo $line |  sed "s/PASS/$(makepasswd -c $regex)/" >> output.txt
			done < "$input"
			cat output.txt
}


function new_user(){
	while read -r line
	do
		a=( $(echo $line | sed "s/PASS/$(makepasswd -l 15 -c $regex)/") )
		password=${a[3]}
		username=${a[0]}
		group=${a[2]}

		if [ "$group" = "root" ] ; then
			
			# Creates the user wihtin the root group
			sudo useradd $username -b /home/root -g root
			echo $password  |sudo passwd $username --stdin
			echo "The user $username was created with root privileges. Take care .."
		
		elif [ "$group" = "equip_member" ] ; then

			# Creates the equip member user
			sudo useradd $username -b /home/equip_member -g equip_member
			echo $password  | sudo passwd $username --stdin
			echo "The user $username was created within equip member group .."
		elif [ "$group" = "guest" ] ; then			
			# Creates the guest user
			sudo useradd $username -b /home/guest -g guest
			echo $password  | sudo passwd $username --stdin
			echo "The guest user $username was created  .."
		else
			echo "Group not recognized"
			exit
		fi
		echo  "$username $password $group" >> output.txt
	done < "$input"
}

new_user
