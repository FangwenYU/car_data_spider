# -*- coding: utf-8 -*-
import scrapy
import car.utils as utils
import re


class AutohomeSpider(scrapy.Spider):
    name = "autohome_carid_spider"

    start_urls = ['http://www.autohome.com.cn/a00/','http://www.autohome.com.cn/a0/',
                  'http://www.autohome.com.cn/a/', 'http://www.autohome.com.cn/b/',
                  'http://www.autohome.com.cn/c/', 'http://www.autohome.com.cn/d/',
                  'http://www.autohome.com.cn/suv/', 'http://www.autohome.com.cn/mpv/',
                  'http://www.autohome.com.cn/s/', 'http://www.autohome.com.cn/p/',
                  'http://www.autohome.com.cn/mb/', 'http://www.autohome.com.cn/qk/']

    def __init__(self):
        utils.init_autohome_carid_file()

    def parse(self, response):
        pattern = re.compile(r"http://www.autohome.com.cn/(\d+)/#levelsource")
        car_id_list = response.xpath('//a').re(pattern)
        car_id_set = set(car_id_list)
        utils.save_autohome_carid(car_id_set)
