module WeatherScraper
  # provide city name mapping
  module NameMapping
    def city_mapping(city)
      case city
      when "臺北", "台北", "臺北市", "台北市", "Taipei", "TaipeiCity"
        result = "Taipei_City"
      when "新北", "新北市", "NewTaipei", "NewTaipeiCity"
        result = "New_Taipei_City"
      when "桃園", "桃園市", "Taoyuan", "TaoyuanCity"
        result = "Taoyuan_City"
      when "臺中", "台中", "臺中市", "台中市", "Taichung", "TaichungCity"
        result = "Taichung_City"
      when "臺南", "台南", "臺南市", "台南市", "Tainan", "TainanCity"
        result = "Tainan_City"
      when "高雄", "高雄市", "Kaohsiung", "KaohsiungCity"
        result = "Kaohsiung_City"
      when "基隆", "基隆市", "Keelung", "KeelungCity"
        result = "Keelung_City"
      when "新竹", "新竹市", "Hsinchu", "HsinchuCiy"
        result = "Hsinchu_City"
      when "新竹縣", "HsinchuCounty"
        result = "Hsinchu_County"
      when "苗栗", "苗栗縣", "Miaoli", "MiaoliCounty"
        result = "Miaoli_County"
      when "彰化", "彰化縣", "Changhua", "ChanghuaCounty"
        result = "Changhua_County"
      when "南投", "南投縣", "Nantou", "NantouCounty"
        result = "Nantou_County"
      when "雲林", "雲林縣", "Yunlin", "YunlinCounty"
        result = "Yunlin_County"
      when "嘉義市", "嘉義", "Chiayi", "ChiayiCity"
        result = "Chiayi_City"
      when "嘉義縣", "ChiayiCounty"
        result = "Chiayi_County"
      when "屏東", "屏東縣", "Pingtung", "PingtungCounty"
        result = "Pingtung_County"
      when "宜蘭", "宜蘭縣", "Yilan", "YilanCounty"
        result = "Yilan_County"
      when "花蓮", "花蓮縣","Hualien", "HualienCounty"
        result = "Hualien_County"
      when "臺東", "台東", "台東縣", "臺東縣", "Taitung", "TaitungCounty"
        result = "Taitung_County"
      when "澎湖", "澎湖縣" ,"Penghu", "PenghuCounty"
        result = "Penghu_County"
      when "金門", "金門縣", "Kinmen", "KinmenCounty"
        result = "Kinmen_County"
      when "連江", "連江縣", "Lienchiang", "LienchiangCounty"
        result = "Lienchiang_County"
      else
        result = ""
      end
      result
    end
  end
end
