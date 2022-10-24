This folder contains every substep files I made. 

Those files complete different subgoals in connection to install the magi core. 

Berkeley DB
-----
The file db-4.8.sh installs berkeley-db-4.8 in your system. 

Berkeley DB is used for blockchain and wallet storage. It is required in order to install the magi core. 

    wget https://raw.githubusercontent.com/aaronmidnight/magi-utilities/main/src/db-4.8.sh
    sh db-4.8.sh

The script replaces the original 'config.guess' and 'config.sub' files with up-to-date ones because they are from 2009. 
    
Depencies
-----
The file magid_depencies.sh installs all the required depencies in order to instatll the magi core. 

    wget https://raw.githubusercontent.com/aaronmidnight/magi-utilities/main/src/magid_depencies.sh
    sh magid_depencies.sh
