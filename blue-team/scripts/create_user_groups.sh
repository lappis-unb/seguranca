  GNU nano 7.2                                            create_groups.sh                                            Modified  
#!/usr/bin/bash


BASE_GID=58999

function create_group_folder(){
        if ! test -d $1; then
                sudo mkdir /home/$1
                echo "[+] Created the folder for $1 group"
        fi
}
function create_group(){
        BASE_GID=$((BASE_GID+1))
        if ! getent group $1 >> /dev/null; then
                sudo groupadd $1 -g $BASE_GID
                create_group_folder $1
                echo "[+] Created the $1 group."
        fi
}



# Create the proper groupds
create_group "guest"
create_group "equip_member"

echo "[+] Group of users was created successfully :-D. You may now create the users :-D"
