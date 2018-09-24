

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
  load seed
end

# puts Coordinates::GeoJSON
# puts UHF_Metrics::Parsed
