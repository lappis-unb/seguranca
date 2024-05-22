#!/bin/bash

list=list.txt
function delete_users(){
        while read -r  user
        do
                sudo deluser --remove-home  $user 
        done < $list
}

delete_users  