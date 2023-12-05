#!/bin/bash
address_book_file="address_book.txt"
echo "Welcome to the Address Book"

while true; do
    echo "Select an option:"
    echo "a) Create address book"
    echo "b) View address book"
    echo "c) Insert a record"
    echo "d) Delete a record"
    echo "e) Modify a record"
    echo "f) Exit"

    read -r option

    case $option in
        a) touch "$address_book_file";;
        b) cat "$address_book_file";;
        c) echo "Enter name:"
           read -r name
           echo "Enter address:"
           read -r address
           echo "Enter phone number:"
           read -r phone
           echo "Name: $name, Address: $address, Phone: $phone" >> "$address_book_file"
           echo "Record added";;
        d) echo "Enter the name to delete:"
           read -r delete_name
           sed -i -e "/$delete_name/d" "$address_book_file"
           echo "Record deleted";;
        e) echo "Enter the name to modify:"
           read -r modify_name
           echo "Enter new address:"
           read -r new_address
           echo "Enter new phone number:"
           read -r new_phone
           sed -i -e "/$modify_name/c\\Name: $modify_name, Address: $new_address, Phone: $new_phone" "$address_book_file"
           echo "Record modified";;
        f) echo "Exiting the program..."
           break;;
        *) echo "Invalid option";;
    esac
done
