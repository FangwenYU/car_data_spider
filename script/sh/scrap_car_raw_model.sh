#!/usr/bin/env bash


scrapy crawl carmake_spider
python parse_car_model.py
