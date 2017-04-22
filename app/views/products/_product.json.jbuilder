json.extract! product, :id, :name, :unit_price, :special_qty, :special_price, :created_at, :updated_at
json.url product_url(product, format: :json)
