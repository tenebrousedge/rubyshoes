# creates the brands table
class CreateBrandsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
