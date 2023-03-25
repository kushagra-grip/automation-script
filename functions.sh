find_directory() {
    directory_path=$(find $main_directory -type d -name $1)
}


build_docker_image() {
    find_directory $1
    if [ -z "$directory_path" ]
    then
          echo -e "🔍 ${green}$1${clear} ${red}not found in ${blue}$main_directory${clear}${clear}"
          echo -ne "\n"
          return
    fi
    
    echo -e "⏲️ building docker image for ${green}$1${clear}"
    
    docker_build_command=("docker" "build" "-t" "$1" "$directory_path")
    "${docker_build_command[@]}"
    
    if [ "$?" -eq 0 ]
    then
        echo -e "✅ docker image build successfull for ${green}$1${clear}"
    else
        echo -e "❌ ${red}docker image build failed for${clear} ${green}$1${clear}"
    fi
    
    echo -ne "\n"
}

