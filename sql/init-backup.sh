#!/bin/bash

set -e

DATA_DIR=C:/Users/USER/Documents/LOCATION_TO_BAK_FILES
BAK_FILES=("FILE1" "FILE2" "FILE3")

cd $DATA_DIR

printf "Files already in the database: \n"
dir

for f in ${BAK_FILES[@]}; do
    rm -f $f.mdf
    touch $f.mdf

    rm -f ${f}_log.ldf
    touch ${f}_log.ldf
done

printf "Restoring BAK files... \n"

mssql-cli -U sa -P longpassword -S localhost -i restore_bak_files.sql

printf "BAK files restored, process completed \n"