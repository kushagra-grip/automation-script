# /bin/bash
source ./functions.sh
source ./constants.sh


# --------------------------- HERE TAKING INPUT AND MANAGING THE FILE TO BUILD IN NEXT STAGE ---------------------------

i=1;

if [ -z "$1" ]
    then
        directories=$directories
    else
        directories=()
    fi

for directory in "$@" 
    do
        directories+=("$directory")
        i=$((i + 1));
    done

for i in "${directories[@]}"
    do
        echo $i
    done

echo -ne "\n"

# --------------------------- INPUT PROCESS END HERE ---------------------------

for i in "${directories[@]}"
    do
        build_docker_image $i
    done

exit 0