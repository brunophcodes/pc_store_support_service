class CreateJoinTableCategoriesStores < ActiveRecord::Migration[7.1]
  def change
    create_join_table :categories, :stores  do |t|
      t.index [:category_id, :store_id]
      t.index [:store_id, :category_id]
    end
  end
end
