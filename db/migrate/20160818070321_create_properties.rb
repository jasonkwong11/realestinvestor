class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :city
      t.string :condition
      t.integer :price
    end
  end
end
