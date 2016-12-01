# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/en/latest/topics/item-pipeline.html

import car.utils as util


class CarFeaturePipeline(object):
    def process_item(self, item, spider):
        make = item['make']
        model = item['model']
        year = item['year']
        sub_model = item['sub_model']
        feature_list = item['feature_list']

        util.save_car_feature(make, model, year, sub_model, feature_list)