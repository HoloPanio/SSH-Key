#!/bin/bash

key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCZ+9I9R5yKY5uhtxpDzOCuuHVNwmeGkj+2H1926QHO/chIqQs48bTl6pfT0ik2YjEio86W6gGWv2ChB6rKG11G8UT8xVWA7+ipLbIOp61A6S6RWXd3P0XlNc+Qw+x9AguEXMzU2nmQXLG9obbTNzH3LPLFI7EnQZl2FhcbNaFLIomdumyt0QsZpouKbbEgS0Iv65RnGlIwbDTDjARCjzGd2niwR5z7lOJXdVwAyPlbHpNRrzcWD+aO5JGPWuGjjGi7HAaLZFSj0xwr1xjPevPCXT4lvEpBnaHt+WANZLbfwHVaCtRYqpT9mOnmxERIbK0K1Hz4BTBXJSf/LA7KUAl3 holopanio"

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