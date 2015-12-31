require 'minitest/autorun'
require './lib/weatherdesc.rb'

CITY = "新竹"
weather = DailyWeatherScraper::DailyWeather.new(CITY)

describe 'Daily weather desc scrap' do
  it 'should return date with the "month/day" style' do
    date = weather.date
    date.must_match /\d\d\/\d\d/
  end

  it 'should return temperature in daytime' do
    temp = weather.temperature_day
    temp.must_match /(-|\d)\d+\s~\s(-|\d)\d+/
  end

  it 'should return temperature in nighttime' do
    temp = weather.temperature_night
    temp.must_match /(-|\d)\d+\s~\s(-|\d)\d+/
  end

  it 'should return weather condition in daytime' do
    con = weather.condition_day
    con.must_be_instance_of String
  end

  it 'should return weather condition in nighttime' do
    con = weather.condition_night
    con.must_be_instance_of String
  end

  it 'should return rain probaliity' do
    prob = weather.rain_probability
    prob.must_match /\d+\s%/
  end

  it 'should return weather tips' do
    tips = weather.tips
    tips.must_be_instance_of String
  end
end
