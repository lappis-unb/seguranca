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
		a=( $(echo $line | sed "s/PASS/$(makepasswd -c $regex)/") )
		password=${a[3]}
		username=${a[0]}
		group=${a[2]}
		echo "$username:$password:$group"
	done < "$input"
}

#create_user
new_user
