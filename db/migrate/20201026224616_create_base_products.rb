class CreateBaseProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :base_products do |t|
      t.string :name

      t.timestamps
    end
  end
end
