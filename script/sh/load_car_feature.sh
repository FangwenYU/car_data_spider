#!/usr/bin/env bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "truncate table car_feature;" >  ${CURR_DIR}/load_car_feature.sql

for file in `ls $CURR_DIR/carfeature`
do
    echo "load data local infile '$CURR_DIR/carfeature/$file' into table car_feature fields terminated by ',' enclosed by '\"';" >> ${CURR_DIR}/load_car_feature.sql
    echo " " >> ${CURR_DIR}/load_car_feature.sql
done

sh $CURR_DIR/exec_sql.sh local ${CURR_DIR}/load_car_feature.sql

echo "Done"
