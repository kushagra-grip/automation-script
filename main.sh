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
counter=0
for i in "${directories[@]}"
    do
        let "counter+=1"
        build_docker_image $i $counter
    done

helm_install=("helm" "install" "test" "$main_directory/test" "--atomic")
"${helm_install[@]}" > okay.txt 2> err.txt &

PID=$!
exit_code=$?

progress $PID $exit_code


exit 0