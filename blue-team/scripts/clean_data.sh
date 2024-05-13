#!/usr/bin/bash

function delete_group(){
	if getent group $1 >> /dev/null; then
		if [ "$1" != "admin" ]; then
			sudo groupdel $1 >> /dev/null
			if [ "$?" = "0" ];then
				echo "[+] The group $1 was successfully deleted ."
			fi
		fi
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

delete_users "equipe-dev"
delete_users "equipe-infra"
delete_users "equipe-produto"
delete_users "equipe-dados"
delete_users "equipe-dex"
delete_users "equipe-pencil-labs"
delete_group "guest"
delete_group "admin"

# Delete the group's folder
delete_group "admin"
delete_group "equipe-dev"
delete_group "equipe-infra"
delete_group "equipe-produto"
delete_group "equipe-dados"
delete_group "equipe-dex"
delete_group "equipe-pencil-labs"
delete_group "guest"


rm output.txt 2> /dev/null

echo "[+] DONE."
