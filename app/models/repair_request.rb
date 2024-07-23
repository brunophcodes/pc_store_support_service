class RepairRequest < ApplicationRecord
  belongs_to :store
  validates :client_email, :product_category, :product_name, :repair_description, presence: true
  after_create :asign_store

  private

  def asign_store
    AsignStoreJob.set(wait: 2.hours).perform_later(id)
  end
end
