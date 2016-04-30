json.array!(@orders) do |order|
  json.extract! order, :id, :product_id, :customer_id, :orderDate, :totalCharge
  json.url order_url(order, format: :json)
end
