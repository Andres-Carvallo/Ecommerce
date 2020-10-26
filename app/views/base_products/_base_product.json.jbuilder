json.extract! base_product, :id, :name, :created_at, :updated_at
json.url base_product_url(base_product, format: :json)
