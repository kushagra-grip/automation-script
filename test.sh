


directories=("abcd" "efgh")

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

take_input() {
    directories=("abcd" "efgh")

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
}

# echo "echo $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14"


# take_input $1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14