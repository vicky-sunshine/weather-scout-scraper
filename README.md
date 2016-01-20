# weather-scout
[![Build Status](https://travis-ci.org/vicky-sunshine/weather-scout-scraper.svg)](https://travis-ci.org/vicky-sunshine/weather-scout-scraper)
[![Gem Version](https://badge.fury.io/rb/weatherscout.svg)](https://badge.fury.io/rb/weatherscout)

Weather Scout help you know the weather today!
You won't be frozen or burned outside and find the tips to deal with the temperamental weather :muscle:

## Usage

Install it with the following command:
```sh
$ gem install weatherscout
```

To see the weather today
```sh
$ weatherscout today 新竹
新竹（HsinchuCity）的天氣預測：
今晚至明晨 01/21 00:00~01/21 06:00
  -氣溫：15 ~ 16 度
  -降雨機率：70 %
  -天氣狀況：多雲短暫雨
明日白天 01/21 06:00~01/21 18:00
  -氣溫：15 ~ 18 度
  -降雨機率：60 %
  -天氣狀況：多雲短暫雨
明日晚上 01/21 18:00~01/22 06:00
  -氣溫：15 ~ 17 度
  -降雨機率：70 %
  -天氣狀況：多雲時陰陣雨
溫馨叮嚀：
東北季風及華南雲雨區影響，多雲短暫雨
昨 (20)日，持續受大陸冷氣團影響，氣溫較低，水氣增加，為多雲時陰有短暫雨的天氣，清晨起，局部地區已有短暫陣雨發生。
明 (21)日，受東北季風及華南雲雨區影響，氣溫略回升，為多雲短暫雨的天氣。預估氣溫16-18度，空曠地區有6至8級強陣風；清晨部分地區有短暫陣雨，外出請注意保暖和強風及攜帶雨具備用。
```

The weather in the future week and other feature will be coming soon! :grinning:

## Development
Use it from your Ruby code:
````ruby
require 'weatherscout'
CITY = "新竹"
daily_weather = DailyWeatherScraper::DailyWeather.new(CITY)

city = daily_weather.city
# ""HsinchuCity""
weathers = daily_weather.weathers
# {"今晚至明晨 01/21 00:00~01/21 06:00"=>
#     {"temperature"=>"15 ~ 16",
#      "rain_probability"=>"70 %",
#      "condition"=>"多雲短暫雨"},
#  "明日白天 01/21 06:00~01/21 18:00"=>
#     {"temperature"=>"15 ~ 18",
#      "rain_probability"=>"60 %",
#      "condition"=>"多雲短暫雨"},
#  "明日晚上 01/21 18:00~01/22 06:00"=>
#     {"temperature"=>"15 ~ 17",
#      "rain_probability"=>"70 %",
#      "condition"=>"多雲時陰陣雨"}}
tips = daily_weather.tips
# "東北季風及華南雲雨區影響，多雲短暫雨\n昨 (20)日，持續受大陸冷氣團影響，氣溫較低，水氣增加，為多雲時陰有短暫雨的天氣，清晨起，局部地區已有短暫陣雨發生。\n明 (21)日，受東北季風及華南雲雨區影響，氣溫略回升，為多雲短暫雨的天氣。預估氣溫16-18度，空曠地區有6至8級強陣風；清晨部分地區有短暫陣雨，外出請注意保暖和強風及攜帶雨具備用。\n"

````

## Test
Using [rake](http://docs.seattlerb.org/rake/) to run tests. If you don't have rake using `gem install rake` to install it.

```sh
$ rake
```
