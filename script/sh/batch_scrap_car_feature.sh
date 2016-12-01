#!/usr/bin/env bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

car_make_file=$CURR_DIR/carmake.txt

while read -r line
do
#    echo $line
#    echo $line | awk '{split($0,a,","); print a[0]}'
#    make=`echo $line | awk '{split($0,a,","); print a[0]}'`
#    echo $make
     make=`echo $line | cut -d "," -f 1`
     echo "===$make=="
     sh scrap_car_feature.sh $make
done < "$car_make_file"
