require 'oga'
require 'open-uri'

module DailyWeatherScraper
  # parse course description from sharecourse web
  class DailyWeather
    CWB_URL = "http://www.cwb.gov.tw"
    CITY_WEATHER_URL = "#{CWB_URL}/V7/forecast/taiwan/"

    def initialize(city)
      parse_html(city)
    end

    def date
      @data ||= parse_date
    end

    def temperature_day
      @temperature_day ||= parse_temp_day
    end

    def temperature_night
      @temperature_night ||= parse_temp_night
    end

    def rain_probability
      @rain_probability ||= parse_rain_prob
    end

    def condition_day
      @condition_day ||= parse_condition_day
    end

    def condition_night
      @condition_night ||= parse_condition_night
    end

    def tips
      @tips ||= parse_tips
    end

    private

    def parse_html(city)
      english_name = name_mapping(city)
      url = "#{CITY_WEATHER_URL}/#{english_name}.htm"
      @document = Oga.parse_html(open(url))
    end

    def parse_date
      data = @document.xpath("//table[@class='FcstBoxTable01']")
      result = data[2].children[3].children[0].children[1].children.text.split(" ")[1]
    end

    def parse_temp_day
      data = @document.xpath("//table[@class='FcstBoxTable01']")
      result = data[2].children[3].children[0].children[3].children.text
    end

    def parse_temp_night
      data = @document.xpath("//table[@class='FcstBoxTable01']")
      result = data[2].children[3].children[1].children[3].children.text
    end

    def parse_rain_prob
      data = @document.xpath("//table[@class='FcstBoxTable01']")
      result = data[2].children[3].children[0].children[9].children.text
    end

    def parse_condition_day
      data = @document.xpath("//table[@class='FcstBoxTable01']")
      result = data[2].children[3].children[0].children[5].children[1].attributes[1].value.force_encoding('UTF-8')
    end

    def parse_condition_night
      data = @document.xpath("//table[@class='FcstBoxTable01']")
      result = data[2].children[3].children[1].children[5].children[1].attributes[1].value.force_encoding('UTF-8')
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

    def name_mapping(city)
      case city
      when "臺北", "台北"
        result = "Taipei_City"
      when "新北"
        result = "New_Taipei_City"
      when "桃園"
        result = "Taoyuan_City"
      when "臺中", "台中"
        result = "Taichung_City"
      when "臺南", "台南"
        result = "Tainan_City"
      when "高雄"
        result = "Kaohsiung_City"
      when "基隆"
        result = "Keelung_City"
      when "新竹"
        result = "Hsinchu_City"
      when "新竹"
        result = "Hsinchu_County"
      when "苗栗"
        result = "Miaoli_County"
      when "彰化"
        result = "Changhua_County"
      when "南投"
        result = "Nantou_County"
      when "雲林"
        result = "Yunlin_County"
      when "嘉義"
        result = "Chiayi_City"
      when "嘉義"
        result = "Chiayi_County"
      when "屏東"
        result = "Pingtung_County"
      when "宜蘭"
        result = "Yilan_County"
      when "花蓮"
        result = "Hualien_County"
      when "臺東", "台東"
        result = "Taitung_County"
      when "澎湖"
        result = "Penghu_County"
      when "金門"
        result = "Kinmen_County"
      when "連江"
        result = "Lienchiang_County"
      else
        result = ""
      end
      result
    end
  end
end
