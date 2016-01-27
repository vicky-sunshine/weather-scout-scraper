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
今晚至明晨 01/28 00:00~01/28 06:00
  -氣溫：15 ~ 17 度
  -降雨機率：50 %
  -天氣狀況：多雲短暫陣雨
明日白天 01/28 06:00~01/28 18:00
  -氣溫：15 ~ 20 度
  -降雨機率：80 %
  -天氣狀況：陰時多雲陣雨
明日晚上 01/28 18:00~01/29 06:00
  -氣溫：16 ~ 17 度
  -降雨機率：80 %
  -天氣狀況：多雲時陰陣雨
溫馨叮嚀：
鋒面影響，陰時多雲陣雨
今 (27)日，新竹市地區受華南雲系東移影響部分地區上午有短暫降雨，氣溫稍回升，香山區溫度在12-19度間。入夜後降雨機會增加溫度稍低，外出請注意保暖和攜帶雨具。
明 (28)日，新竹市地區受鋒面影響降雨機會增加，天氣為陰時多雲陣雨，預報氣溫16到20度。外出請注意保暖和攜帶雨具。
明 (28)日，新竹沿海平均風力5至6陣風8級，船隻請注意。
```

To see the weather in the future week
```sh
$ weatherscou week 新竹
新竹（HsinchuCity）的未來一週預測：
01/28星期四
  -白天溫度：15 ~ 20 度
  -白天天氣狀況：陰時多雲陣雨
  -晚上溫度：16 ~ 17 度
  -晚上天氣狀況：多雲時陰陣雨
01/29星期五
  -白天溫度：16 ~ 18 度
  -白天天氣狀況：多雲時陰陣雨
  -晚上溫度：15 ~ 16 度
  -晚上天氣狀況：陰陣雨
01/30星期六
  -白天溫度：15 ~ 16 度
  -白天天氣狀況：多雲時陰陣雨
  -晚上溫度：14 ~ 15 度
  -晚上天氣狀況：多雲時陰陣雨
01/31星期日
  -白天溫度：14 ~ 17 度
  -白天天氣狀況：多雲時陰短暫雨
  -晚上溫度：14 ~ 15 度
  -晚上天氣狀況：陰短暫雨
02/01星期一
  -白天溫度：14 ~ 17 度
  -白天天氣狀況：多雲時陰短暫雨
  -晚上溫度：14 ~ 16 度
  -晚上天氣狀況：多雲短暫雨
02/02星期二
  -白天溫度：14 ~ 17 度
  -白天天氣狀況：陰時多雲短暫雨
  -晚上溫度：14 ~ 16 度
  -晚上天氣狀況：多雲時陰短暫雨
02/03星期三
  -白天溫度：14 ~ 17 度
  -白天天氣狀況：多雲時陰短暫雨
  -晚上溫度：14 ~ 16 度
  -晚上天氣狀況：多雲短暫雨
```

## Development
Use it from your Ruby code:
#### DailyWeather
````ruby
require 'weatherscout'
CITY = "新竹"
daily_weather = WeatherScraper::DailyWeather.new(CITY)

city = daily_weather.city
# "HsinchuCity"

weathers = daily_weather.weathers
# {"今晚至明晨 01/28 00:00~01/28 06:00"=>
#   {"temperature"=>"15 ~ 17",
#    "rain_probability"=>"50 %",
#    "condition"=>"多雲短暫陣雨"},
#  "明日白天 01/28 06:00~01/28 18:00"=>
#   {"temperature"=>"15 ~ 20",
#    "rain_probability"=>"80 %",
#    "condition"=>"陰時多雲陣雨"},
#  "明日晚上 01/28 18:00~01/29 06:00"=>
#   {"temperature"=>"16 ~ 17",
#    "rain_probability"=>"80 %",
#    "condition"=>"多雲時陰陣雨"}}

tips = daily_weather.tips
# "鋒面影響，陰時多雲陣雨\n今 (27)日，新竹市地區受華南雲系東移影響部分地區上午有短暫降雨，氣溫稍回升，香山區溫度在12-19度間。入夜後降雨機會增加溫度稍低，外出請注意保暖和攜帶雨具。\n明 (28)日，新竹市地區受鋒面影響降雨機會增加，天氣為陰時多雲陣雨，預報氣溫16到20度。外出請注意保暖和攜帶雨具。\n明 (28)日，新竹沿海平均風力5至6陣風8級，船隻請注意。\n"

````

####WeeklyWeather
```ruby
require 'weatherscout'
CITY = "新竹"
weekly_weather = WeatherScraper::WeeklyWeather.new(CITY)

city = daily_weather.city
# "HsinchuCity"

weathers = daily_weather.weathers
# {"01/28星期四"=>
#   {"day_temperature"=>"15 ~ 20",
#    "day_condition"=>"陰時多雲陣雨",
#    "night_temperature"=>"16 ~ 17",
#    "night_condition"=>"多雲時陰陣雨"},
#  "01/29星期五"=>
#   {"day_temperature"=>"16 ~ 18",
#    "day_condition"=>"多雲時陰陣雨",
#    "night_temperature"=>"15 ~ 16",
#    "night_condition"=>"陰陣雨"},
#  "01/30星期六"=>
#   {"day_temperature"=>"15 ~ 16",
#    "day_condition"=>"多雲時陰陣雨",
#    "night_temperature"=>"14 ~ 15",
#    "night_condition"=>"多雲時陰陣雨"},
#  "01/31星期日"=>
#   {"day_temperature"=>"14 ~ 17",
#    "day_condition"=>"多雲時陰短暫雨",
#    "night_temperature"=>"14 ~ 15",
#    "night_condition"=>"陰短暫雨"},
#  "02/01星期一"=>
#   {"day_temperature"=>"14 ~ 17",
#    "day_condition"=>"多雲時陰短暫雨",
#    "night_temperature"=>"14 ~ 16",
#    "night_condition"=>"多雲短暫雨"},
#  "02/02星期二"=>
#   {"day_temperature"=>"14 ~ 17",
#    "day_condition"=>"陰時多雲短暫雨",
#    "night_temperature"=>"14 ~ 16",
#    "night_condition"=>"多雲時陰短暫雨"},
#  "02/03星期三"=>
#   {"day_temperature"=>"14 ~ 17",
#    "day_condition"=>"多雲時陰短暫雨",
#    "night_temperature"=>"14 ~ 16",
#    "night_condition"=>"多雲短暫雨"}}
```

## Test
Using [rake](http://docs.seattlerb.org/rake/) to run tests. If you don't have rake using `gem install rake` to install it.

```sh
$ rake
```
