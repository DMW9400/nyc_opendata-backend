module OpenData
  require 'curb'
  require 'json'



  http = Curl.get("https://data.cityofnewyork.us/resource/ah89-62h9.json?$$app_token=LUEOzBK6IUAyZVp7zYDxuvZht")
  parsed = JSON.parse(http.body_str)



end
