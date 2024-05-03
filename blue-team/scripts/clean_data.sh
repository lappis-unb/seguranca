#!/usr/bin/bash

function delete_group(){
	if getent group $1 >> /dev/null; then
		sudo groupdel $1 >> /dev/null
		echo "[+] The group $1 was successfully deleted ."
	fi
	if test -d /home/$1 >> /dev/null; then
		sudo rm -rf /home/$1
		echo "[+] Deleted the remaining folder of the $1 group."
	fi
}

# Create the group's folder
delete_group "equip_member"
delete_group "guest"
delete_group "administrator"

echo "[+] DONE."
