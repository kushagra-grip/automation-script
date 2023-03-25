#!/bin/bash
# progressdots.sh - Display progress while making backup
# Based on idea presnted by nixCraft forum user rockdalinux
# Show progress dots


progress() {
    spinner=(⬆️ ↗️ ➡️ ↘️ ⬇️ ↙️ ⬅️ ↖️)
    while true
    do    
        for i in ${spinner[@]}
        do        
            echo -ne "\r$i building docker image"
            sleep 0.5
        done
    done
}


dobackup(){
    sleep 5
}

progress &
MYSELF=$!

dobackup

echo -ne "\n"
kill $MYSELF 


