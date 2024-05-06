#!/usr/bin/bash

function delete_group(){
	if getent group $1 >> /dev/null; then
		sudo groupdel $1 >> /dev/null
		echo "[+] The group $1 was successfully deleted ."
	fi
	if test -d /home/$1 >> /dev/null; then
		sudo rm -rf /home/$1 2> /dev/null
		echo "[+] Deleted the remaining folder of the $1 group."
	fi
}
function delete_users(){
	if test -d /home/$1; then
		ls /home/$1 > /tmp/user_list
		while read -r user
		do
			sudo userdel $user -r
			echo "The user $user was deleted .."
		done < /tmp/user_list
	fi
}

# Create the group's folder
delete_group "equip_member"
delete_group "guest"
delete_group "administrator"

delete_users root
delete_users guest
delete_users equip_member

rm output.txt 2> /dev/null

echo "[+] DONE."
username@username:~