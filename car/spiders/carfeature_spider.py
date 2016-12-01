# -*- coding: utf-8 -*-
import scrapy
from scrapy import Selector, Request
from car.items import CarFeatureItem
import car.utils as util


class CarfeatureSpider(scrapy.Spider):
    name = "carfeature_spider"
    # allowed_domains = ["www.edmunds.com"]

    # def start_requests(self):
    #     for make in utils.car_make():
    #         print "car make: ", make
    #         url = 'http://www.edmunds.com/api/vehicle/v2/{}/models?fmt=json&state=new&state=future&view=full'.format(make)
    #         yield Request(url, callback=self.parse, dont_filter=True, meta={'make':make})


    def __init__(self, make):
        self.make = make

    def start_requests(self):
        util.init_car_feature(self.make)
        for item in util.process_car_feature_scrap(self.make):
            make, model, year, sub_model = item
            url = 'http://www.edmunds.com/{}/{}/{}/{}/features-specs/'.format(make, model, year, sub_model)
            yield Request(url, callback=self.parse, dont_filter=True, meta={'make':make, 'model':model, 'year':year, 'sub_model':sub_model})

    # start_urls = ['http://www.edmunds.com/fiat/500/2016/abarth/features-specs/']

    # feature_map = {
    #     'roofglass': 'Roof and Glass',
    #     'body': 'Body',
    #     'tirewheels': 'Tires and Wheels',
    #     'safety': 'Safety',
    #     'SAFETY': 'Safety',
    #     'frontseats': 'Front Seats',
    #     'rearseats': 'Rear Seats',
    #     'powerfeatures': 'Power Features',
    #     'instrumentation': 'Instrumentation',
    #     'convenience': 'Convenience',
    #     'comfort': 'Comfort',
    #     'audio': 'In Car Entertainment',
    #     'telematics': 'Telematics',
    #     'memorized': 'Memorized settings',
    #     'towingandhauling': 'Towing and Hauling'
    # }

    def parse(self, response):
        make = response.meta['make']
        model = response.meta['model']
        year = response.meta['year']
        sub_model = response.meta['sub_model']

        features = Selector(response).xpath('//div[@class="feature-spec box"]/table[@data-selenium]')

        feature_list = {}
        for feature in features:
            feature_name = feature.xpath('@data-selenium').extract()[0].lower()
            if feature_name not in feature_list:
                feature_list[feature_name] = []
            for feature_value in feature.xpath('tr/td/ul/li/p/text()'):
                item_value = feature_value.extract()
                feature_list[feature_name].append(item_value)

        car_feature = CarFeatureItem()
        car_feature['make'] = make
        car_feature['model'] = model
        car_feature['year'] = year
        car_feature['sub_model'] = sub_model
        car_feature['feature_list'] = feature_list

        yield car_feature




