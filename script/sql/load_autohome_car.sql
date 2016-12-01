truncate table autohome_car;
load data local infile '/Users/fangyu/study/python/PycharmProjects/car/autohome/cars.txt' into table autohome_car fields terminated by ',' enclosed by '"';
 
