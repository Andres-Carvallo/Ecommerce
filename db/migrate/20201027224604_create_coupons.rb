class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :discount
      t.boolean :unique

      t.timestamps
    end
  end
end
