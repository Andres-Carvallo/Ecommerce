json.extract! user_coupon, :id, :name, :discount, :unique, :mount_discount, :created_at, :updated_at
json.url user_coupon_url(user_coupon, format: :json)
