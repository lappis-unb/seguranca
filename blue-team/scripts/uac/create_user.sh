#!/usr/bin/bash

regex=1234567890abcdefghijklmnopqrstuvxwyzABCDEFGHIJKLMNOPQRSTUVXWYZ
input=user_list.txt

function create_user(){
                        while read -r line
                        do
                                echo $line |  sed "s/PASS/$(makepasswd -c $regex)/" >> output.txt
                        done < "$input"
                        cat output.txt
}

function create_user(){
    if test -f $input; then
            while read -r line
            do
                    a=( $(echo $line | sed "s/PASS/$(makepasswd --chars 15 --string $regex)/") )
                    password=${a[1]}
                    username=${a[0]}
                    email=${a[2]}
                    group=${a[3]}

                    if [[ "$group" = "sudo" || "$group" = "equipe-dev" || "$group" = "equipe-infra" || "$group" = "equipe-produto" || "$group" = "equipe-dados" || "$group" = "equipe-dex" || "$group" = "equipe-pencil-labs" ]] ; then
                            
                            # Creates the user wihtin the admin group
                            sudo useradd $username -s /bin/bash -m -b /home/$group -g $group
                            echo "$username:$password" | sudo chpasswd
                            echo "The user $username was created with $group privileges. Take care .."
                    else
                            echo "Group not recognized. EXITING"
                            exit
                    fi
                    echo  "$username $password $email $group" >> new_users.txt
            done < "$input"
    else
        echo "The $input file not provided. EXITING"
        exit
    fi
}
cat /dev/null > new_users.txt
create_user