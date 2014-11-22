json.(@message, :id, :content, :created_at)
json.lonlat RGeo::GeoJSON.encode(@message.lonlat)
json.user do
  json.name @message.user.name
  json.image @message.user.avatar.url
end