create table car_make
(
    nice_name varchar(100),
    name varchar(100)
);

create table car_model
(
    make_id varchar(20),
    make_name varchar(100),
    make_nice_name varchar(100),
    model_id varchar(20),
    model_name varchar(100),
    model_nice_name varchar(100),
    year_id varchar(20),
    year int,
    style_id varchar(20),
    style_name varchar(100),
    style_trim varchar(100),
    sub_model_body varchar(100),
    sub_model_name varchar(100),
    sub_model_nice_name varchar(100)
);

create table car_feature
(
    make varchar(100),
    model varchar(50),
    year int,
    sub_model varchar(50),
    feature_name varchar(100),
    feature_value varchar(200)
)
;

create table autohome_car
(
    series_id int,
    spec_id int,
    category varchar(100),
    feature_name varchar(100),
    feature_value varchar(100),
    price_value varchar(20)
)
;


create table autohome_car_make as
select a.series_id, a.spec_id, b.feature_value as car_make, a.feature_value as car_spec, c.feature_value as car_price, d.feature_value as car_type
from autohome_car a
join autohome_car b
on a.series_id = b.series_id and a.spec_id = b.spec_id
join autohome_car c
on a.series_id = c.series_id and a.spec_id = c.spec_id
join autohome_car d
on a.series_id = d.series_id and a.spec_id = d.spec_id
where a.feature_name = '车型名称'
and b.feature_name = '厂商'
and c.feature_name = '厂商指导价(元)'
and d.feature_name = '级别'
;



set @rn=96;
create table autohome_car_category_code
as
select char(row_num) as category_code,
       category
from
(
    select   category,
             @rn:=@rn+1 as row_num
    from
    (
        select category
        from autohome_car
        group by category
    ) t
    order by category
) t2;


set @current_category='a';
set @rn = 0;
create table autohome_car_feature_code
as
select concat(b.category_code, '_', rn) as feature_code, a.category, a.feature_name
from
(
    select
        category,
        feature_name,
        @rn := if(category=@current_category, @rn+1, 1) as rn,
        @current_category := category
    from
    (
        select category, feature_name
        from autohome_car
        group by category, feature_name
    ) t
    order by category, feature_name
) a
join autohome_car_category_code b
on a.category = b.category;
