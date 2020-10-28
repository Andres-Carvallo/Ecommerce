class AddMountDiscountToCoupon < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :mount_discount, :integer
    add_reference :orders, :coupon, foreign_key: true
  end
end
