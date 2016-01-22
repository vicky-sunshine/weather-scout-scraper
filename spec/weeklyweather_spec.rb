require 'minitest/autorun'
require './lib/weatherscout.rb'

WEEKLY_CITY = "新竹"
weekly_weather = WeatherScraper::WeeklyWeather.new(WEEKLY_CITY)

describe 'Weekly weather desc scrap' do

  it 'should return city name' do
    city = weekly_weather.city
    city.must_be_instance_of String
  end

  it 'has the right number of period weathers' do
    weathers = weekly_weather.weathers
    weathers.size.must_equal 7
  end

  it 'should return the timestamp in correct format' do
    timestamps = weekly_weather.weathers.keys
    timestamps.each do |timestamp|
      timestamp.must_match /\d\d\/\d\d.../
    end
  end

  it 'should return day temperature' do
    weathers = weekly_weather.weathers.values
    weathers.each do |weather|
      day_temperature = weather["day_temperature"]
      day_temperature.must_match /(-|\d)\d*\s~\s(-|\d)\d*/
    end
  end

  it 'should return night temperature' do
    weathers = weekly_weather.weathers.values
    weathers.each do |weather|
      night_temperature = weather["night_temperature"]
      night_temperature.must_match /(-|\d)\d*\s~\s(-|\d)\d*/
    end
  end

  it 'should return day condition' do
    weathers = weekly_weather.weathers.values
    weathers.each do |weather|
      day_condition = weather["day_condition"]
      day_condition.must_be_instance_of String
    end
  end

  it 'should return night condition' do
    weathers = weekly_weather.weathers.values
    weathers.each do |weather|
      night_condition = weather["night_condition"]
      night_condition.must_be_instance_of String
    end
  end
end
