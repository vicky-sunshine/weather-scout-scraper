# weather-scout
[![Build Status](https://travis-ci.org/vicky-sunshine/weather-scout-scraper.svg)](https://travis-ci.org/vicky-sunshine/weather-scout-scraper)

A simple CLI project to know the weather today!

## Usage

Install it with the following command:
```sh
$ bundle install
```

Run it from the command line.
```sh
$ ./bin/weatherscout today 台北
台北12/31天氣狀況：
白天氣象：多雲時陰，氣溫 15 ~ 16 度
晚上氣象：多雲，氣溫 15 ~ 22 度
降雨機率：20 %
溫馨叮嚀：
【跨年夜氣溫偏冷，元旦水氣少、天氣穩定】。
今天（３１日）東北季風影響，山區有局部短暫雨，其他地區為多雲到陰的天氣；氣溫方面，一整天較涼冷，台北站區高溫17.0度，低溫15.2度。
今晚至明（１月１日）晨仍受東北季風影響，台北市各區低溫約15至17度左右，提醒參加跨年活動或迎接日出的朋友做好保暖的措施。
天氣方面，水氣由濕轉乾的過程，入夜之後水氣更少，元旦清晨雲量較少，大多可以看到日出，高山欣賞曙光的條件相對理想許多。
明天白天之後，東北季風減弱，氣溫略回升，高溫可以來到22至23度；天氣方面，水氣更為減少，各區大多為多雲到晴的天氣。
此外，今晚至明晨東北季風影響，空曠地區易有較強陣風。
```



Use it from your Ruby code:
````ruby
require './lib/coursesdesc/courses.rb'
CITY = "新竹"
weather = DailyWeatherScraper::DailyWeather.new(CITY)

temp = weather.temperature_day
puts "今天白天氣溫：#{temp}"

tips = weather.tips
puts tips

````

## Test

```sh
$ rake
```
