#!/usr/bin/env bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

db=$1
input_file=$2
param=$3
[ $param ] || param=dummy

output_file=$4
[ $output_file ] || output_file=$CURR_DIR/dummy.txt

echo ======== Params List ===========
echo + DB: $db
echo + Input File: $input_file
echo + param: $param
echo + Output File: $output_file
echo ================================

mysql --defaults-extra-file=$CURR_DIR/db.$db -A -N -e"set @param='$param'; source $input_file;" > $output_file
