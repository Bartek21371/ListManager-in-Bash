#!/bin/bash

RED="31"
BOLDRED="\e[1;${RED}m"
UNDERLINE_RED="\e[4;${RED}m"
GREEN="32"
BOLDGREEN="\e[1;${GREEN}m"
CYAN="\e[36m"
ENDCOLOR="\e[0m"



SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dir="$SCRIPT_DIR/list_text"
mkdir -p "$dir"

open_list(){
	local path="$1"
	touch "$path"
	sleep 2
	nano "$path"
	echo -e "${BOLDGREEN}List closed.${ENDCOLOR}"
}


validation_of_file_name(){
	local file="$1"
	if [[ -z "$file" ]]; then
		echo -e "${UNDERLINE_RED}Name of list cannot be empty!${ENDCOLOR}"
		return 1
	fi
}

check_is_list_e(){
	local file="$1"
	local path="$dir/$file.txt"

	if [ -f "$path" ]; then
		echo -e "${CYAN}This list exists.${ENDCOLOR}"
	else
		echo -e "${BOLDGREEN}Created list $file${ENDCOLOR}"
		echo -e "${CYAN}Opening $file list...${ENDCOLOR}"
		open_list "$path"
	fi
}


create_list(){
	local file
	read -p "Enter list name: " file
	validation_of_file_name "$file"
	local check="$?"

	if [ $check -ne 1 ]; then
		check_is_list_e "$file"
	fi
}


show_existing_lists(){
	if [ -d "$dir" ]; then
		shopt -s nullglob
		local files=("$dir"/*.txt)
		shopt -u nullglob
		
		for f in "${files[@]}"; do
			basename "${f%.txt}"
		done
	else
		echo -e "${BOLDRED}Directory $dir no exist.${ENDCOLOR}"
	fi
}


delete_list(){
	local ask=""
	local file

	read -p "Enter file name: " file
	validation_of_file_name "$file"
	local check="$?"
	local path="$dir/$file.txt"
	
	if [ $check -ne 1 ]; then
		if ! [ -f "$path" ]; then
			echo -e "${BOLDRED}$file don't exists${ENDCOLOR}"
		else
			read -r -p "Are you sure [y/N]: " ask #COLOR YN
			if [[ "$ask" =~ ^([yY]|[yY][eE][sS])$ ]]; then
				rm "$path"
				echo -e "${BOLDGREEN}List $file deleted!${ENDCOLOR}"
			else
				echo -e "${BOLDRED}Can't delete $file${ENDCOLOR}"
			fi
		fi
	fi
}


edit_list(){
	local file
	read -p "Enter list which you want to edit: " file
	validation_of_file_name "$file"
	local check="$?"

	if [ $check -ne 1 ]; then
		local path="$dir/$file.txt"

		if [ -f "$path" ]; then
			echo -e "${CYAN}Opening $file to edit...${ENDCOLOR}"
			open_list "$path"
		else
			echo -e "${BOLDRED}$file doesn't exists!${ENDCOLOR}"
		fi
	fi
}


show_options_and_choose(){
	clear
	PS3="Choose option from list (enter number): "
	local options=("Create new list" "Show existing lists" "Delete list" "Edit list" "Quit")
	echo -e "Hello in To Do List Manager"
	select opt in "${options[@]}";
	do
		case $opt in	
			"Create new list") create_list ;;
			"Show existing lists") show_existing_lists ;;
			"Delete list") delete_list ;;
			"Edit list") edit_list ;;
			"Quit") echo "Goodbye" && exit ;;
			*) echo "Enter correct number!"
		   	   echo "Enter number again.";;
		esac
	done
}

show_options_and_choose

