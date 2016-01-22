require 'vcr'
require 'webmock'
require 'minitest/autorun'
require './lib/weatherscout.rb'

DAILY_CITY = "新竹"

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
end

VCR.use_cassette('dailytweather') do
  daily_weather = WeatherScraper::DailyWeather.new(DAILY_CITY)
  describe 'Daily weather desc scrap' do

    it 'should return city name' do
      city = daily_weather.city
      city.must_be_instance_of String
    end

    it 'has the right number of period weathers' do
      weathers = daily_weather.weathers
      weathers.size.must_equal 3
    end

    it 'should return the timestamp in correct format' do
      timestamps = daily_weather.weathers.keys
      timestamps.each do |timestamp|
        timestamp.must_match /\A.{4,5}\s\d\d\/\d\d\s\d\d:\d\d~\d\d\/\d\d\s\d\d:\d\d/
      end
    end

    it 'should return temperature' do
      weathers = daily_weather.weathers.values
      weathers.each do |weather|
        temperature = weather["temperature"]
        temperature.must_match /(-|\d)\d*\s~\s(-|\d)\d*/
      end
    end

    it 'should return weather condition' do
      weathers = daily_weather.weathers.values
      weathers.each do |weather|
        condition = weather["condition"]
        condition.must_be_instance_of String
      end
    end

    it 'should return rain probaliity' do
      weathers = daily_weather.weathers.values
      weathers.each do |weather|
        probaliity = weather["rain_probability"]
        probaliity.must_match /\d+\s%/
      end
    end

    # it 'should return weather tips' do
    #   tips = daily_weather.tips
    #   tips.must_be_instance_of String
    # end
  end
end
