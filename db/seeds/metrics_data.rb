require 'curb'
require 'json'

module UHF_Metrics
  http = Curl.get("https://data.cityofnewyork.us/resource/ah89-62h9.json?$$app_token=LUEOzBK6IUAyZVp7zYDxuvZht")
  Parsed = JSON.parse(http.body_str)
end
