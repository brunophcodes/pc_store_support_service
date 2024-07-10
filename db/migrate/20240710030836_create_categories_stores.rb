class CreateCategoriesStores < ActiveRecord::Migration[7.1]
  def change
    create_table :categories_stores do |t|

      t.timestamps
    end
  end
end
