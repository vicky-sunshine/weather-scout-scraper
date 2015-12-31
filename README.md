# weather-scout

A simple CLI project to know the weather today!

## Usage

Install it with the following command:
```sh
$ bundle install
```

Run it from the command line.
```sh
$ ./bin/weatherscout today 新竹
12/31 新竹
白天- 晴時多雲    氣溫 15 ~ 16 度
晚上- 多雲  氣溫 15 ~ 23 度
降雨機率 0 %
溫馨叮嚀：
清晨東北季風影響，早晚氣溫低

今(31)日，新竹市地區仍受東北季風影響，為多雲的天氣，空曠地區易有８至９級強陣風，香山區白天溫度在15-19度左右；外出請注意保暖及注意安全。

明(1)日，新竹市地區清晨東北季風影響，早晚氣溫低，為多雲的天氣，預報溫度在16到18度之間；外出請注意保暖及注意安全。

明(1)日，新竹沿海地區風力7至8陣風10級下午轉5至6陣風8級，作業船隻及海邊活動仍請注意安全。
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
