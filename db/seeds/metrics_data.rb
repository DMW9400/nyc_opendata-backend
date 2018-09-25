require 'curb'
require 'json'

module UHF_Metrics
  http = Curl.get("https://data.cityofnewyork.us/resource/ah89-62h9.json?$$app_token=LUEOzBK6IUAyZVp7zYDxuvZht")
  parsed = JSON.parse(http.body_str)

  Borough_Array = []

  parsed.each do |item|
    if item["geo_type_name"] == 'UHF42'
      Borough_Array.push(item)
    end
  end

end
