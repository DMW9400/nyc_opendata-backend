require 'curb'
require 'json'

# require '../geojson.rb'

http = Curl.get("https://data.cityofnewyork.us/resource/ah89-62h9.json?$$app_token=")
parsed = JSON.parse(http.body_str)

uhf42_metrics = []
parsed.each do |item|
  if item["geo_type_name"] == 'UHF42'
    # uhf42_metrics.push(item)
    Metric.create
  end
end

puts uhf42_metrics
