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
新竹（01/01）天氣狀況：
白天氣象：多雲，氣溫 15 ~ 16 度
晚上氣象：多雲，氣溫 15 ~ 23 度
降雨機率：0 %
溫馨叮嚀：
清晨東北季風影響，早晚氣溫低
今(31)日，新竹市地區仍受東北季風影響，為多雲的天氣，空曠地區易有８至９級強陣風，香山區白天溫度在15-19度左右；外出請注意保暖及注意安全。
明(1)日，新竹市地區清晨東北季風影響，早晚氣溫低，為多雲的天氣，預報溫度在16到18度之間；外出請注意保暖及注意安全。
明(1)日，新竹沿海地區風力7至8陣風10級下午轉5至6陣風8級，作業船隻及海邊活動仍請注意安全。
```

The weather in the future week and other feature will be coming soon! :grinning:

## Development
Use it from your Ruby code:
````ruby
require 'weatherscout'
CITY = "新竹"
weather = DailyWeatherScraper::DailyWeather.new(CITY)

temp = weather.temperature_day
puts "今天白天氣溫：#{temp}"

tips = weather.tips
puts "溫馨提示：\n#{tips}"

````

## Test
Using [rake](http://docs.seattlerb.org/rake/) to run tests. If you don't have rake using `gem install rake` to install it.

```sh
$ rake
```
