require 'curb'
require 'json'

require './geojson.rb'
#
# class Fetch
#   def fetch_attempt
#     http = Curl.get("https://data.cityofnewyork.us/resource/6aka-uima.json?$$app_token=LUEOzBK6IUAyZVp7zYDxuvZht")
#     puts http.body_str
#   end
# end

# http = Curl.get("https://data.cityofnewyork.us/resource/ah89-62h9.json?$$app_token=#{your token here}")

# parsed = JSON.parse(http.body_str)

# borough_array = []
#
# parsed.each do |item|
#   if item["geo_type_name"] == 'UHF42'
#     borough_array.push(item)
#   end
#   borough_array
# end
#
# puts borough_array

Coordinates::GeoJSON[:features].each do |thing|
  return_obj = {}
  return_obj[:uhf_neigh] = thing[:properties][:uhf_neigh]
  return_obj[:uhf_code] = thing[:properties][:uhfcode]
  return_obj[:geoJSON] = thing
  # puts 'this thing'
  puts return_obj
end
