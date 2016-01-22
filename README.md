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

To see the weather in the future week
```sh
$ weatherscout week 新竹
新竹（HsinchuCity）的未來一週預測：
01/23星期六
  -白天溫度：8 ~ 12 度
  -白天天氣狀況：陰時多雲陣雨
  -晚上溫度：6 ~ 8 度
  -晚上天氣狀況：陰時多雲短暫雨
01/24星期日
  -白天溫度：5 ~ 7 度
  -白天天氣狀況：多雲短暫雨
  -晚上溫度：4 ~ 5 度
  -晚上天氣狀況：多雲
01/25星期一
  -白天溫度：4 ~ 10 度
  -白天天氣狀況：多雲時晴
  -晚上溫度：8 ~ 9 度
  -晚上天氣狀況：晴時多雲
01/26星期二
  -白天溫度：8 ~ 18 度
  -白天天氣狀況：多雲時晴
  -晚上溫度：13 ~ 15 度
  -晚上天氣狀況：晴時多雲
01/27星期三
  -白天溫度：12 ~ 19 度
  -白天天氣狀況：多雲時陰
  -晚上溫度：15 ~ 16 度
  -晚上天氣狀況：陰時多雲短暫陣雨
01/28星期四
  -白天溫度：15 ~ 18 度
  -白天天氣狀況：多雲時陰短暫陣雨
  -晚上溫度：15 ~ 16 度
  -晚上天氣狀況：陰短暫陣雨
01/29星期五
  -白天溫度：15 ~ 18 度
  -白天天氣狀況：陰短暫陣雨
  -晚上溫度：15 ~ 16 度
  -晚上天氣狀況：陰天
```

## Development
Use it from your Ruby code:
#### DailyWeather
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

####WeeklyWeather
```ruby
require 'weatherscout'
CITY = "新竹"
weekly_weather = WeatherScraper::WeeklyWeather.new(CITY)

city = daily_weather.city
# ""HsinchuCity""

weathers = daily_weather.weathers
# {"01/23星期六"=>{
#     "day_temperature"=>"8 ~ 12",
#     "day_condition"=>"陰時多雲陣雨",
#     "night_temperature"=>"6 ~ 8",
#     "night_condition"=>"陰時多雲短暫雨"},
#  "01/24星期日"=>{
#      "day_temperature"=>"5 ~ 7",
#      "day_condition"=>"多雲短暫雨",
#      "night_temperature"=>"4 ~ 5",
#      "night_condition"=>"多雲"},
#  "01/25星期一"=>{
#      "day_temperature"=>"4 ~ 10",
#      "day_condition"=>"多雲時晴",
#      "night_temperature"=>"8 ~ 9",
#      "night_condition"=>"晴時多雲"},
#  "01/26星期二"=>{
#      "day_temperature"=>"8 ~ 18",
#      "day_condition"=>"多雲時晴",
#      "night_temperature"=>"13 ~ 15",
#      "night_condition"=>"晴時多雲"},
#  "01/27星期三"=>{
#      "day_temperature"=>"12 ~ 19",
#      "day_condition"=>"多雲時陰",
#      "night_temperature"=>"15 ~ 16",
#      "night_condition"=>"陰時多雲短暫陣雨"},
#  "01/28星期四"=>{
#      "day_temperature"=>"15 ~ 18",
#      "day_condition"=>"多雲時陰短暫陣雨",
#      "night_temperature"=>"15 ~ 16",
#      "night_condition"=>"陰短暫陣雨"},
#  "01/29星期五"=>{
#      "day_temperature"=>"15 ~ 18",
#      "day_condition"=>"陰短暫陣雨",
#      "night_temperature"=>"15 ~ 16",
#      "night_condition"=>"陰天"}}

```

## Test
Using [rake](http://docs.seattlerb.org/rake/) to run tests. If you don't have rake using `gem install rake` to install it.

```sh
$ rake
```
