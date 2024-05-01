#!/usr/bin/bash

function create_group_folder(){
	if ! test -d $1; then
		sudo mkdir $1
		echo "[+] Created the folder for $1 group"
	fi
}
function create_group(){
	if ! getent group $1 >> /dev/null; then
		sudo groupadd $1
		echo "[+] Created the $1 group."
	fi
}

# Variables
interns_home_path="/home/interns_group"
equip_members_home_path="/home/equip_members_group"
guests_home_path="/home/guest"
admin_home_path="/home/administrator"

# Create the group's folder
create_group_folder $interns_home_path
create_group_folder $equip_members_home_path
create_group_folder $guests_home_path
create_group_folder $admin_home_path

# Create the proper groupds
create_group "equip_members"
create_group "guest"

echo "[+] Group of users was created successfully :-D. You may now create the users :-D"
