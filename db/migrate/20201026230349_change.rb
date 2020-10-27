class Change < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :parent_category_id, :integer
    add_foreign_key :categories, :categories, column: :parent_category_id
  end
end
