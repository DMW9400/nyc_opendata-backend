require 'curb'
require 'json'

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
  load seed
end

puts Coordinates::GeoJSON

http = Curl.get("https://data.cityofnewyork.us/resource/ah89-62h9.json?$$app_token=LUEOzBK6IUAyZVp7zYDxuvZht")
parsed = JSON.parse(http.body_str)



parsed.each do |item|
  if item["geo_type_name"] == 'UHF42'
    Metric.create(name: item["name"], measure: item["measure"], data_value: item["data_valuemessage"], year: item["year_description"], region_code: item["geo_entity_id"])

    puts item
  end
end
