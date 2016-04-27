class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.string :description
      t.string :use_type

      t.timestamps null: false
    end
  end
end
