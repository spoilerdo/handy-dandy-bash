#!/bin/bash

PROJECT=""
MONTHS="3"
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

clean_branches() {
    if ! [[ -z "$PROJECT" ]] ; then
        printf "Removing branches for project: ${PROJECT} \n"
        cd ${PROJECT}
    fi

    printf "Removing all branches older then ${1} month ago \n"

    MONTH_FILTER=${1}-1
    for k in $(git branch | sed /\*/d); do
        if [ -z "$(git log -1 --since="${MONTH_FILTER} month ago" -s $k)" ]; then
            git branch -D $k
        fi
    done

    printf "Done \n"
}

while getopts ":m:p:" option; do
    case $option in
        p) # Pass the project
            if ! [[ $OPTARG =~ $IS_NUMBER ]] ;
            then
                printf "Error: Not a number \n"
            else
                get_project $OPTARG
            fi
            ;;
        m) #Pass the months
            if ! [[ $OPTARG =~ $IS_NUMBER ]] ;
            then
                printf "Error: Not a number \n"
            else
                MONTHS=$OPTARG
            fi
            ;;
        \?) # Invalid option
            printf "Error: Invalid option \n"
            ;;
    esac
done

clean_branches $MONTHS