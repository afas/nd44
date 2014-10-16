json.array!(@houses) do |house|
  json.extract! house, :id, :address, :latitude, :longitude, :chairman, :info
  json.url house_url(house, format: :json)
end
