class CreateUserCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :user_coupons do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :discount
      t.boolean :unique
      t.integer :mount_discount

      t.timestamps
    end
  end
end
