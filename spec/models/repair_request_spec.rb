require 'rails_helper'

RSpec.describe RepairRequest, type: :model do
  it { should validate_presence_of(:client_email) }
  it { should validate_presence_of(:product_category) }
  it { should validate_presence_of(:product_name) }
  it { should validate_presence_of(:repair_description) }


  it { should belong_to(:store)  }
end
