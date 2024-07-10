class RepairRequest < ApplicationRecord
  validates :client_email, :product_category, :product_name, :repair_description, presence: true
end
