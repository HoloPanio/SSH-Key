#!/bin/bash

key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCUwzdN+e5xyW58L6CkQkiUKx/EYI8HHwuQjWyMjVD7V/13prvWo6gxn8AhFZnBVe08CizVGW58cZv5u7JyPd99N6hOgrLBdhVvTHVUtpdNJ6ZEQOm9a/bQrV/LP5LdlPKnB5sWZjroxyiDGp08w5ICs/wHuItmrZ+AVpzSHF0krgUYfAod1VwCVqxeSLjCzBHGEBR3kASEwSVRUs+r4qnqAq3Wa1JMYxFYxnqtRhayvZ0VzAtn8FLyxFmzGl1/2T1E9BFcnflGmnWs3BgjlwS7NVLEM6hycL6h2z4IVQ21pDKbs0u7QnvyfufLP5poWYoq1JD+hMzMf5S57q9HKYPX holopanio"

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