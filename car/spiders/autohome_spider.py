# -*- coding: utf-8 -*-
import scrapy
from scrapy import Selector, Request
import car.utils as utils
import re


class AutohomeSpider(scrapy.Spider):
    name = "autohome_spider"
    # allowed_domains = ["www.edmunds.com"]

    # start_urls = ['http://car.autohome.com.cn/config/series/450.html']

    def start_requests(self):
        for car_id in utils.get_autohome_carid_list():
            print "car series id: ", car_id
            url = 'http://car.autohome.com.cn/config/series/{}.html'.format(car_id)
            yield Request(url, callback=self.parse, dont_filter=True, meta={'car_id':car_id})

    def parse(self, response):
        car_id = response.meta['car_id']
        # pattern = re.compile(r"var option = ({.*}?);", re.MULTILINE | re.DOTALL)
        autohome_car = Selector(response).xpath('//script[contains(., "var option")]/text()')
        if autohome_car:
            autohome_car_content = autohome_car.extract()[0]
            utils.save_autohome(car_id, autohome_car_content)
