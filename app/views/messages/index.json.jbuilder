json.array!(@messages) do |message|
  json.extract! message, :id, :content
  json.lonlat RGeo::GeoJSON.encode(message.lonlat)
  json.user message.user.name
  json.url message_url(message, format: :json)
end
