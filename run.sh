#!/bin/bash

## send '-f' to force the container to be rebuild
set -e

main(){
    if [[ "$1" == "-f" || "$(docker images -q pycpptest:main 2> /dev/null)" == "" ]]; then
        docker build -t pycpptest:main .;
    fi

    loc=`pwd`/source

    docker run -it --name pycppTest --rm -v $loc:/opt/app pycpptest:main 

}

checkDocker(){
    if [ -f /.dockerenv ]; then
        echo "ERROR: Cannot start container from within another container..."
        echo -e "\tExiting!"
        exit 1
    fi
}

checkDocker
main $@
