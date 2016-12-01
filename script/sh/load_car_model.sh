#!/usr/bin/env bash

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "truncate table car_model;" >  ${CURR_DIR}/load_car_model.sql

for file in `ls $CURR_DIR/carmodel`
do
    echo "load data local infile '$CURR_DIR/carmodel/$file' into table car_model fields terminated by ',' enclosed by '\"';" >> ${CURR_DIR}/load_car_model.sql
    echo " " >> ${CURR_DIR}/load_car_model.sql
done

sh $CURR_DIR/exec_sql.sh local ${CURR_DIR}/load_car_model.sql

echo "Done"