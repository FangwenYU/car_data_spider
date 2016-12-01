#!/usr/bin/env bash

make=$1

scrapy crawl carfeature_spider -a make=$make

