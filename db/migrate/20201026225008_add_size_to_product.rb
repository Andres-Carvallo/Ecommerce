class AddSizeToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :size, :string
    add_column :products, :color, :string
    add_reference :products, :base_product, foreign_key: true
  end
end
