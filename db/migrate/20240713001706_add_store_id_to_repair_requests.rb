class AddStoreIdToRepairRequests < ActiveRecord::Migration[7.1]
  def change
    add_reference :repair_requests, :store, foreign_key: true
  end
end
