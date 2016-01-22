require 'oga'
require 'open-uri'
require_relative 'name_mapping'

module WeatherScraper
  # parse weekly weather description from cwb website
  class WeeklyWeather
    include NameMapping
    CWB_URL = "http://www.cwb.gov.tw"
    CITY_WEATHER_URL = "#{CWB_URL}/V7/forecast/taiwan/inc/city"

    def initialize(city)
      @city = city_mapping(city).delete("_")
      parse_html(city_mapping(city))
    end

    def city
      @city
    end

    def weathers
      @weathers ||= parse_weathers
    end

    private

    def parse_html(city)
      url = "#{CITY_WEATHER_URL}/#{city}.htm"
      @document = Oga.parse_html(open(url))
    end

    def parse_weathers
      timestamp = @document.xpath("//th[@width='11%']")
      timestamp = timestamp.map {|e| e.text.force_encoding('UTF-8')}

      data = @document.xpath("//td")
      temperature = data.map { |e| e.text.split("   ")[2]}
      condition = data.map{ |e| e.children[1].attributes[1].value.force_encoding('UTF-8')}

      result = []
      timestamp.each_index do |i|
        result << [timestamp[i],
                    {"day_temperature" => temperature[i+7],
                     "day_condition" => condition[i+7],
                     "night_temperature" => temperature[i],
                     "night_condition" => condition[i]
                    }
                  ]
      end
      result.to_h
    end
  end
end
