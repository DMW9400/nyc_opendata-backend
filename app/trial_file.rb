require 'curb'
require 'json'
#
# class Fetch
#   def fetch_attempt
#     http = Curl.get("https://data.cityofnewyork.us/resource/6aka-uima.json?$$app_token=LUEOzBK6IUAyZVp7zYDxuvZht")
#     puts http.body_str
#   end
# end

http = Curl.get("https://data.cityofnewyork.us/resource/ah89-62h9.json?$$app_token=LUEOzBK6IUAyZVp7zYDxuvZht")

parsed = JSON.parse(http.body_str)

borough_array = []

parsed.each do |item|
  if !borough_array.include?(item["geo_entity_name"])
    borough_array.push(item["geo_entity_name"])
  end
  borough_array
end

puts borough_array
