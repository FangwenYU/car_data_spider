# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class CarItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    pass


class CarFeatureItem(scrapy.Item):
    make = scrapy.Field()
    model = scrapy.Field()
    year = scrapy.Field()
    sub_model = scrapy.Field()
    feature_list = scrapy.Field()
