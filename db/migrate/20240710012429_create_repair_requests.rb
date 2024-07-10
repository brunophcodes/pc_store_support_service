class CreateRepairRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :repair_requests do |t|
      t.string :client_email
      t.string :product_name
      t.string :product_category
      t.text :repair_description
      t.decimal :repair_price
      t.string :repair_status

      t.timestamps
    end
  end
end
