#!/usr/bin/env bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "truncate table autohome_car;" >  ${CURR_DIR}/load_autohome_car.sql

echo "load data local infile '$CURR_DIR/autohome/cars.txt' into table autohome_car fields terminated by ',' enclosed by '\"';" >> ${CURR_DIR}/load_autohome_car.sql
echo " " >> ${CURR_DIR}/load_autohome_car.sql

sh $CURR_DIR/exec_sql.sh local ${CURR_DIR}/load_autohome_car.sql

echo "Done"
