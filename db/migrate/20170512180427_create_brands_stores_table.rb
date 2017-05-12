# creates the join table
class CreateBrandsStoresTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :brands, :stores do |t|
      t.index :brand_id
      t.index :store_id
    end
  end
end
