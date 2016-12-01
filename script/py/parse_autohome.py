import json
import os
import re

CURR_DIR = os.path.dirname(os.path.abspath(__file__))


def coroutine(func):
    def start(*args,**kwargs):
        cr = func(*args,**kwargs)
        cr.next()
        return cr
    return start


@coroutine
def save_autohome(output):
    while True:
        series_id, spec_id, category, feature_name, feature_value, price = (yield)
        output.write('"{}","{}","{}","{}","{}","{}"\n'.format(series_id, spec_id,
                                                         category.encode('utf-8'),
                                                         feature_name.encode('utf-8'),
                                                         feature_value.encode('utf-8'), price))

def parse_config(config, writer):

    data = json.loads(config)

    if data['returncode'] != 0:
        return

    series_id = data['result']['seriesid']
    param_type_items = data['result']['paramtypeitems']

    for item in param_type_items:
        category = item['name']
        category_items = item['paramitems']
        for category_item in category_items:
            feature_name = category_item['name']
            feature_values = category_item['valueitems']
            for feature_value in feature_values:
                spec_id = feature_value['specid']
                spec_value = feature_value['value']
                writer.send((series_id, spec_id, category, feature_name, spec_value, ''))


def parse_option(config, writer):

    data = json.loads(config)

    if data['returncode'] != 0:
        return

    series_id = data['result']['seriesid']
    config_type_items = data['result']['configtypeitems']

    for item in config_type_items:
        category = item['name']
        category_items = item['configitems']
        for category_item in category_items:
            feature_name = category_item['name']
            feature_values = category_item['valueitems']
            for feature_value in feature_values:
                spec_id = feature_value['specid']
                spec_value = feature_value['value']
                price = feature_value['price']
                if price:
                    price_value = price[0]['price']
                else:
                    price_value = ''
                writer.send((series_id, spec_id, category, feature_name, spec_value, price_value))


def parse_keylink(keylink, writer):
    pass


def parse_rawdata(file_name, writer):

    for line in open(os.path.join(CURR_DIR, 'autohome', 'rawdata', file_name), 'r'):
        stripped_line = line.strip()
        if stripped_line.startswith('var config'):
            pattern = re.compile(r'var config = ({.*}?);')
            parse_config(pattern.match(stripped_line).group(1), writer)
            # print pattern.match(stripped_line).group(1)
        elif stripped_line.startswith('var option'):
            pattern = re.compile(r'var option = ({.*}?);')
            parse_option(pattern.match(stripped_line).group(1), writer)
        elif stripped_line.startswith('var keyLink'):
            pattern = re.compile(r'var keyLink = ({.*}?);')
            parse_keylink(pattern.match(stripped_line).group(1), writer)


def parse_all_rawdata():
    with open(os.path.join(CURR_DIR, 'autohome', 'cars.txt'), 'w') as output:
        writer = save_autohome(output)
        for f in os.listdir(os.path.join(CURR_DIR, 'autohome', 'rawdata')):
            if f == 'carid.txt': pass
            print "Processing file - {}".format(f)
            parse_rawdata(f, writer)


if __name__ == '__main__':
    parse_all_rawdata()
