select t0.series_id, t0.spec_id,
a_11.a_11,
a_6.a_6,
a_1.a_1,
a_13.a_13,
a_8.a_8,
a_3.a_3,
a_10.a_10,
a_5.a_5,
a_12.a_12,
a_7.a_7,
a_2.a_2,
a_9.a_9,
a_4.a_4,
f_11.f_11,
f_6.f_6,
f_1.f_1,
f_8.f_8,
f_3.f_3,
f_10.f_10,
f_5.f_5,
f_12.f_12,
f_7.f_7,
f_2.f_2,
f_9.f_9,
f_4.f_4,
g_9.g_9,
g_4.g_4,
g_11.g_11,
g_6.g_6,
g_1.g_1,
g_13.g_13,
g_8.g_8,
g_3.g_3,
g_10.g_10,
g_5.g_5,
g_12.g_12,
g_7.g_7,
g_2.g_2,
q_1.q_1,
q_8.q_8,
q_3.q_3,
q_10.q_10,
q_5.q_5,
q_7.q_7,
q_2.q_2,
q_9.q_9,
q_4.q_4,
q_6.q_6
from autohome_car_make t0

left join
(
    select series_id,
           spec_id,
           feature_value as a_11
    from   autohome_car
    where  category = '内部配置'
    and    feature_name = '方向盘调节'
) a_11 on t0.series_id = a_11.series_id and t0.spec_id = a_11.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as a_6
    from   autohome_car
    where  category = '内部配置'
    and    feature_name = '定速巡航'
) a_6 on t0.series_id = a_6.series_id and t0.spec_id = a_6.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as a_1
    from   autohome_car
    where  category = '内部配置'
    and    feature_name = 'HUD抬头数字显示'
) a_1 on t0.series_id = a_1.series_id and t0.spec_id = a_1.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as a_13
    from   autohome_car
    where  category = '内部配置'
    and    feature_name = '行车电脑显示屏'
) a_13 on t0.series_id = a_13.series_id and t0.spec_id = a_13.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as a_8
    from   autohome_car
    where  category = '内部配置'
    and    feature_name = '方向盘换挡'
) a_8 on t0.series_id = a_8.series_id and t0.spec_id = a_8.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as a_3
    from   autohome_car
    where  category = '内部配置'
    and    feature_name = '全液晶仪表盘'
) a_3 on t0.series_id = a_3.series_id and t0.spec_id = a_3.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as a_10
    from   autohome_car
    where  category = '内部配置'
    and    feature_name = '方向盘记忆'
) a_10 on t0.series_id = a_10.series_id and t0.spec_id = a_10.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as a_5
    from   autohome_car
    where  category = '内部配置'
    and    feature_name = '多功能方向盘'
) a_5 on t0.series_id = a_5.series_id and t0.spec_id = a_5.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as a_12
    from   autohome_car
    where  category = '内部配置'
    and    feature_name = '真皮方向盘'
) a_12 on t0.series_id = a_12.series_id and t0.spec_id = a_12.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as a_7
    from   autohome_car
    where  category = '内部配置'
    and    feature_name = '方向盘加热'
) a_7 on t0.series_id = a_7.series_id and t0.spec_id = a_7.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as a_2
    from   autohome_car
    where  category = '内部配置'
    and    feature_name = '倒车视频影像'
) a_2 on t0.series_id = a_2.series_id and t0.spec_id = a_2.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as a_9
    from   autohome_car
    where  category = '内部配置'
    and    feature_name = '方向盘电动调节'
) a_9 on t0.series_id = a_9.series_id and t0.spec_id = a_9.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as a_4
    from   autohome_car
    where  category = '内部配置'
    and    feature_name = '前/后驻车雷达'
) a_4 on t0.series_id = a_4.series_id and t0.spec_id = a_4.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as f_11
    from   autohome_car
    where  category = '多媒体配置'
    and    feature_name = '蓝牙/车载电话'
) f_11 on t0.series_id = f_11.series_id and t0.spec_id = f_11.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as f_6
    from   autohome_car
    where  category = '多媒体配置'
    and    feature_name = '外接音源接口'
) f_6 on t0.series_id = f_6.series_id and t0.spec_id = f_6.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as f_1
    from   autohome_car
    where  category = '多媒体配置'
    and    feature_name = '220V/230V电源'
) f_1 on t0.series_id = f_1.series_id and t0.spec_id = f_1.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as f_8
    from   autohome_car
    where  category = '多媒体配置'
    and    feature_name = '定位互动服务'
) f_8 on t0.series_id = f_8.series_id and t0.spec_id = f_8.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as f_3
    from   autohome_car
    where  category = '多媒体配置'
    and    feature_name = 'GPS导航系统'
) f_3 on t0.series_id = f_3.series_id and t0.spec_id = f_3.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as f_10
    from   autohome_car
    where  category = '多媒体配置'
    and    feature_name = '扬声器数量'
) f_10 on t0.series_id = f_10.series_id and t0.spec_id = f_10.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as f_5
    from   autohome_car
    where  category = '多媒体配置'
    and    feature_name = '后排液晶屏'
) f_5 on t0.series_id = f_5.series_id and t0.spec_id = f_5.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as f_12
    from   autohome_car
    where  category = '多媒体配置'
    and    feature_name = '车载电视'
) f_12 on t0.series_id = f_12.series_id and t0.spec_id = f_12.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as f_7
    from   autohome_car
    where  category = '多媒体配置'
    and    feature_name = '多媒体系统'
) f_7 on t0.series_id = f_7.series_id and t0.spec_id = f_7.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as f_2
    from   autohome_car
    where  category = '多媒体配置'
    and    feature_name = 'CD支持MP3/WMA'
) f_2 on t0.series_id = f_2.series_id and t0.spec_id = f_2.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as f_9
    from   autohome_car
    where  category = '多媒体配置'
    and    feature_name = '扬声器品牌'
) f_9 on t0.series_id = f_9.series_id and t0.spec_id = f_9.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as f_4
    from   autohome_car
    where  category = '多媒体配置'
    and    feature_name = '中控台彩色大屏'
) f_4 on t0.series_id = f_4.series_id and t0.spec_id = f_4.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as g_9
    from   autohome_car
    where  category = '安全装备'
    and    feature_name = '胎压监测装置'
) g_9 on t0.series_id = g_9.series_id and t0.spec_id = g_9.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as g_4
    from   autohome_car
    where  category = '安全装备'
    and    feature_name = '前/后排头部气囊(气帘)'
) g_4 on t0.series_id = g_4.series_id and t0.spec_id = g_4.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as g_11
    from   autohome_car
    where  category = '安全装备'
    and    feature_name = '车内中控锁'
) g_11 on t0.series_id = g_11.series_id and t0.spec_id = g_11.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as g_6
    from   autohome_car
    where  category = '安全装备'
    and    feature_name = '安全带未系提示'
) g_6 on t0.series_id = g_6.series_id and t0.spec_id = g_6.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as g_1
    from   autohome_car
    where  category = '安全装备'
    and    feature_name = 'ISOFIX儿童座椅接口'
) g_1 on t0.series_id = g_1.series_id and t0.spec_id = g_1.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as g_13
    from   autohome_car
    where  category = '安全装备'
    and    feature_name = '零胎压继续行驶'
) g_13 on t0.series_id = g_13.series_id and t0.spec_id = g_13.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as g_8
    from   autohome_car
    where  category = '安全装备'
    and    feature_name = '无钥匙进入系统'
) g_8 on t0.series_id = g_8.series_id and t0.spec_id = g_8.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as g_3
    from   autohome_car
    where  category = '安全装备'
    and    feature_name = '前/后排侧气囊'
) g_3 on t0.series_id = g_3.series_id and t0.spec_id = g_3.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as g_10
    from   autohome_car
    where  category = '安全装备'
    and    feature_name = '膝部气囊'
) g_10 on t0.series_id = g_10.series_id and t0.spec_id = g_10.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as g_5
    from   autohome_car
    where  category = '安全装备'
    and    feature_name = '发动机电子防盗'
) g_5 on t0.series_id = g_5.series_id and t0.spec_id = g_5.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as g_12
    from   autohome_car
    where  category = '安全装备'
    and    feature_name = '遥控钥匙'
) g_12 on t0.series_id = g_12.series_id and t0.spec_id = g_12.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as g_7
    from   autohome_car
    where  category = '安全装备'
    and    feature_name = '无钥匙启动系统'
) g_7 on t0.series_id = g_7.series_id and t0.spec_id = g_7.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as g_2
    from   autohome_car
    where  category = '安全装备'
    and    feature_name = '主/副驾驶座安全气囊'
) g_2 on t0.series_id = g_2.series_id and t0.spec_id = g_2.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as q_1
    from   autohome_car
    where  category = '高科技配置'
    and    feature_name = '中控液晶屏分屏显示'
) q_1 on t0.series_id = q_1.series_id and t0.spec_id = q_1.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as q_8
    from   autohome_car
    where  category = '高科技配置'
    and    feature_name = '自动泊车入位'
) q_8 on t0.series_id = q_8.series_id and t0.spec_id = q_8.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as q_3
    from   autohome_car
    where  category = '高科技配置'
    and    feature_name = '全景摄像头'
) q_3 on t0.series_id = q_3.series_id and t0.spec_id = q_3.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as q_10
    from   autohome_car
    where  category = '高科技配置'
    and    feature_name = '车道偏离预警系统'
) q_10 on t0.series_id = q_10.series_id and t0.spec_id = q_10.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as q_5
    from   autohome_car
    where  category = '高科技配置'
    and    feature_name = '夜视系统'
) q_5 on t0.series_id = q_5.series_id and t0.spec_id = q_5.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as q_7
    from   autohome_car
    where  category = '高科技配置'
    and    feature_name = '整体主动转向系统'
) q_7 on t0.series_id = q_7.series_id and t0.spec_id = q_7.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as q_2
    from   autohome_car
    where  category = '高科技配置'
    and    feature_name = '主动刹车/主动安全系统'
) q_2 on t0.series_id = q_2.series_id and t0.spec_id = q_2.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as q_9
    from   autohome_car
    where  category = '高科技配置'
    and    feature_name = '自适应巡航'
) q_9 on t0.series_id = q_9.series_id and t0.spec_id = q_9.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as q_4
    from   autohome_car
    where  category = '高科技配置'
    and    feature_name = '发动机启停技术'
) q_4 on t0.series_id = q_4.series_id and t0.spec_id = q_4.spec_id


left join
(
    select series_id,
           spec_id,
           feature_value as q_6
    from   autohome_car
    where  category = '高科技配置'
    and    feature_name = '并线辅助'
) q_6 on t0.series_id = q_6.series_id and t0.spec_id = q_6.spec_id

;
