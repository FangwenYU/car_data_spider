# -*- coding: utf-8 -*-
import scrapy
from scrapy import Selector, Request
import car.utils as utils


class CarmakeSpider(scrapy.Spider):
    name = "carmake_spider"
    # allowed_domains = ["www.edmunds.com"]

    def start_requests(self):
        for make in utils.car_make():
            print "car make: ", make
            url = 'http://www.edmunds.com/api/vehicle/v2/{}/models?fmt=json&state=new&state=future&view=full'.format(make)
            yield Request(url, callback=self.parse, dont_filter=True, meta={'make':make})

    def parse(self, response):
        make = response.meta['make']
        utils.save_car_make(make, response.body)

