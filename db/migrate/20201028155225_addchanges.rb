class Addchanges < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :user_coupon, foreign_key: true
  end
end
