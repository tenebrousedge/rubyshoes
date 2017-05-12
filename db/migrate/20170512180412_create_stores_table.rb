# creates the stores table
class CreateStoresTable < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.timestamps
    end
  end
end
