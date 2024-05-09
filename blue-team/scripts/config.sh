#!/usr/bin/bash

sudo apt install makepasswd -y

function create_group_folder(){
        if ! test -d $1; then
                sudo mkdir /home/$1
                echo "[+] Created the folder for $1 group"
        fi
}
function create_group(){
        if ! getent group $1 >> /dev/null; then
                sudo groupadd $1 
                create_group_folder $1
                echo "[+] Created the $1 group."
        fi
}

# Create the proper groupds
create_group "equipe-dev"
create_group "equipe-dev"
create_group "equipe-infra"
create_group "equipe-produto"
create_group "equipe-dados"
create_group "equipe-dex"
create_group "equipe-pencil-labs"
create_group "guest"

echo "[+] Group of users was created successfully :-D. You may now create the users :-D"
