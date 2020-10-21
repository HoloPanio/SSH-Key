#!/bin/bash

key="ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAh2qvl30krVvfivtbyGfX5CxIRJaZEDFhQDV/K7RDHTc6529jrN5/h6UynPbKYk1YixyHUgtAdpktifTUU7a80b3BVoVvfJmiM1ZlGzI3j4pln087JhinMDxoqURtkVj8m6zVkDE+l5GXfqvZxoa/yV0k0nXVyaDKDIyVaHF7+c8UvxEiDU6A3E/ylk0GQnB9HrLqXRrtAGQ5fEbEWXhR2yhCyyp0n1u0iSi9XcrA/NGeZWKvHcGpFGqnVgqTSJZzkHVzXL/iosLPy1imngIPpt0EGB+CKPyUqK7ayskEWpZuLOJ3fIPMQw92/mRvI0wepJvhsZfSO6o5n6dTc84AFQ== HoloPanio"

div="-------------------------------------------------------------"

welcome() {

    echo "
    __  ______  ____               __________ __  __   __ __          
   / / / / __ \/ __ \___ _   __   / ___/ ___// / / /  / //_/__  __  __
  / /_/ / /_/ / / / / _ \ | / /   \__ \\\\__ \/ /_/ /  / ,< / _ \/ / / /
 / __  / ____/ /_/ /  __/ |/ /   ___/ /__/ / __  /  / /| /  __/ /_/ / 
/_/ /_/_/   /_____/\___/|___/   /____/____/_/ /_/  /_/ |_\___/\__, /  
                                                             /____/   
"

echo "

Thank you for installing HoloPanio's SSH Access Script.
This script will install the SSH key of HoloPanio to your system to give him temporary access.
This script can be used to install and uninstall the script.
"
}

options() {
    echo $div
    echo " "
    echo "What would you like to do."
    echo " "

    echo "1 | Install my SSH Key"
    echo "2 | Remove my SSH Key"

    read option

}

installKey() {
    cd
    mkdir -p .ssh
    if grep -q "$key" ".ssh/authorized_keys" -s ; then
        echo "| ERROR | \n SSH key is already installed."
    else
        echo "$key" >> ~/.ssh/authorized_keys
        echo "SSH Key has sucessfully been installed!"
    fi
}

removeKey() {
    cd
    if grep -q "$key" ".ssh/authorized_keys" -s ; then
        sed -i '/HoloPanio/d' .ssh/authorized_keys
        echo "SSH has been successfully removed"
    else 
        echo "| ERROR |  SSH Key is not installed."
    fi
}

welcome
sleep 3s
options
case $option in 
    1)  installKey
    ;;
    2)  removeKey
    ;;
    *)  echo "Invalid Selection, try again: "
    options
esac