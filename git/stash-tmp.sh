#!/bin/bash

PROJECT=""
IS_NUMBER="^[0-9]+$"

get_project () {
    case $1 in
        "1")
            PROJECT="Project 1"
            ;;
        "2")
            PROJECT="Project 2"
            ;;
        "3")
            PROJECT="Project 3"
            ;;
        "4")
            PROJECT="Project 4"
            ;;
    esac
}

stash_tmp () {
    if ! [[ -z "$PROJECT" ]] ; then
        printf "Stashing for project: ${PROJECT} \n"
        cd ${PROJECT}
    fi

    git stash push -u -m "tmp"
    printf "Changes stashed \n"
}

while getopts ":p:" option; do
   case $option in
      p) # Pass the project
        if ! [[ $OPTARG =~ $IS_NUMBER ]] ;
        then
            printf "Error: Not a number \n"
        else
            get_project $OPTARG
            stash_tmp
        fi
        exit;;
     \?) # Invalid option
         printf "Error: Invalid option \n"
         exit;;
   esac
done

get_project $PROJECT
stash_tmp
