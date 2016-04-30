json.array!(@shopkeepers) do |shopkeeper|
  json.extract! shopkeeper, :id, :name, :email
  json.url shopkeeper_url(shopkeeper, format: :json)
end
