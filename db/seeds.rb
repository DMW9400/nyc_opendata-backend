

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


# puts Coordinates::GeoJSON
# puts UHF_Metrics::Parsed
