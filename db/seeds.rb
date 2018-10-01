
require 'json'

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
  load seed
end

geo_array = []

Coordinates::GeoJSON[:features].each do |jsonRegion|
  return_obj = {}
  return_obj[:uhf_neigh] = jsonRegion[:properties][:uhf_neigh]
  return_obj[:uhf_code] = jsonRegion[:properties][:uhfcode]
  return_obj[:geoJSON] = jsonRegion.to_json
  geo_array.push(return_obj)
end

geo_array.each do |geo_item|
  Region.create(name: geo_item[:uhf_neigh], uhf_code: geo_item[:uhf_code], geoJSON: geo_item[:geoJSON])
end

UHF_Metrics::Borough_Array.each do |metric|
  found_region_id = nil
  metric_id = metric["geo_entity_id"].to_i
  Region.all.each do |region|
    if region.uhf_code == metric_id
      found_region_id = region.id
    end
  end
  Metric.create(name: metric["name"], measure: metric["measure"], data_value: metric["data_valuemessage"], year: metric["year_description"], region_code: metric["geo_entity_id"], region_id: found_region_id )
end


# puts Coordinates::GeoJSON
# puts UHF_Metrics::Parsed
