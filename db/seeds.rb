

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
  load seed
end

geo_array = []

Coordinates::GeoJSON[:features].each do |jsonRegion|
  return_obj = {}
  return_obj[:uhf_neigh] = jsonRegion[:properties][:uhf_neigh]
  return_obj[:uhf_code] = jsonRegion[:properties][:uhfcode]
  return_obj[:geoJSON] = jsonRegion
  geo_array.push(return_obj)
end

geo_array.each do |geo_item|
  Region.create(name: geo_item[:uhf_neigh], uhf_code: geo_item[:uhf_code], geoJSON: geo_item[:geoJSON])
end

UHF_Metrics::Borough_Array.each do |metric|
  metric_id = metric["geo_entity_id"]
  Region.all.each do |region|
    puts  region.uhf_code
    # puts `metric id: #{metric["geo_entity_id"]}, region id: #{region.uhf_code}`
    if region.uhf_code == metric["geo_entity_id"]
      return 'MATCH'
    end
  end
  # puts found_region_id
  # Metric.create(name: metric["name"], measure: metric["measure"], data_value: metric["data_valuemessage"], year: metric["year_description"], region_code: metric["geo_entity_id"], region_id: found_region_id )
end


# puts Coordinates::GeoJSON
# puts UHF_Metrics::Parsed
