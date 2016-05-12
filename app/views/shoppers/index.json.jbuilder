json.array!(@shoppers) do |shopper|
  json.extract! shopper, :id, :name, :username, :cart
  json.url shopper_url(shopper, format: :json)
end
