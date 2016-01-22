require 'oga'
require 'open-uri'
require_relative 'name_mapping'

module WeatherScraper
  # parse daily weather description from cwb website
  class DailyWeather
    include NameMapping
    CWB_URL = "http://www.cwb.gov.tw"
    CITY_WEATHER_URL = "#{CWB_URL}/V7/forecast/taiwan/"

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

    def tips
      @tips ||= parse_tips
    end

    private

    def parse_html(city)
      url = "#{CITY_WEATHER_URL}/#{city}.htm"
      @document = Oga.parse_html(open(url))
    end

    def parse_weathers
      data = @document.xpath("//table[@class='FcstBoxTable01']")
      data[2].children[3].children.map do |weathers|
        timestamp= weathers.children[1].children.text.force_encoding('UTF-8')
        temperature = weathers.children[3].children.text
        rain_probability = weathers.children[9].children.text
        condition = weathers.children[5].children[1].attributes[1].value.force_encoding('UTF-8')
        [timestamp,
         {"temperature" => temperature,
          "rain_probability" => rain_probability,
          "condition" => condition}]
      end.to_h
    end

    def parse_tips
      data = @document.xpath("//div[@id='box8']")
      tips_api = data[0].children[13].children[0].text.split("'")[1]
      tips_url = "#{CWB_URL}/#{tips_api}"
      tips_doc = Oga.parse_html(open(tips_url))
      result = ""
      tips_doc.children.each do |element|
        if element.text.empty?
          result << "\n"
        elsif element.text.split(":")[0].force_encoding('UTF-8') == "更新時間"
          break
        else
          result << element.text
        end
      end
      result = result.gsub("\n\n","\n")
      result.force_encoding('UTF-8')
    end
  end
end
