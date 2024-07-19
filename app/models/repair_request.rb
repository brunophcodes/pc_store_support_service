class RepairRequest < ApplicationRecord
  belongs_to :store
  
  validates :client_email, :product_category, :product_name, :repair_description, presence: true
end
