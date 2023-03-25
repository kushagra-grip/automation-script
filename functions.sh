source ./constants.sh

find_directory() {
    directory_path=$(find $main_directory -type d -name $1)
}


build_docker_image() {
    find_directory $1
    if [ -z "$directory_path" ]
    then
          echo -e "🔍 ${green}${bold}$1${normal}${clear} ${red}${bold}not found in ${normal}${blue}$main_directory${clear}${clear}"
          echo -ne "\n"
          return
    fi
    
    echo -e "⏲️ building docker image for ${green}${bold}$1${normal}${clear}"
    
    docker_build_command=("docker" "build" "-t" "$1" "$directory_path")
    "${docker_build_command[@]}"
    
    if [ "$?" -eq 0 ]
    then
        echo -e "✅ docker image build successfull for ${green}${bold}$1($2/${#directories[@]})${normal}${clear}"
    else
        echo -e "❌ ${red}${bold}docker image build failed for${normal}${clear} ${green}${bold}$1${normal}${clear}"
    fi
    
    echo -ne "\n"
}


progress() {
    spinner=(⬆️ ↗️ ➡️ ↘️ ⬇️ ↙️ ⬅️ ↖️)
    while [ -d /proc/$1 ]
    do    
        for i in ${spinner[@]}
        do        
            echo -ne "\r$i Deployment in progress"
            sleep 0.5
        done
    done
}
