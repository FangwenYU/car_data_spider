# -*- encoding: utf-8 -*-

import mysql.connector

class MySQL(object):

    def __init__(self):

        self.mysql_config = {
            'user': 'ydata',
            'password': 'ydata',
            'host': '127.0.0.1',
            'database': 'ydata',
            'port': 3306
        }

    def __enter__(self):
        self.connection = mysql.connector.connect(**self.mysql_config)
        self.cursor = self.connection.cursor(buffered=True)
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.cursor.close()
        self.connection.commit()
        self.connection.close()
        return False


def get_feature_code():
    sql = "select feature_code, category, feature_name from autohome_car_feature_code where substr(feature_code, 1, 1) in ('a', 'g','f','q')"
    with MySQL() as db:
        cursor = db.cursor
        cursor.execute(sql)
        for items in cursor:
            yield (items[0], items[1], items[2])


sql_template = u'''
left join
(
    select series_id,
           spec_id,
           feature_value as {}
    from   autohome_car
    where  category = '{}'
    and    feature_name = '{}'
) {} on t0.series_id = {}.series_id and t0.spec_id = {}.spec_id
'''

sql_select = ['select t0.series_id, t0.spec_id']
sql_snippet = []

for feature_code, category, feature_name in get_feature_code():
    sql_snippet.append(sql_template.format(feature_code, category, feature_name, feature_code, feature_code, feature_code))
    sql_select.append('{}.{}'.format(feature_code, feature_code))

print ',\n'.join(sql_select)

print 'from autohome_car_make t0'

for i in sql_snippet:
    print i.encode('utf-8')

print ';'
