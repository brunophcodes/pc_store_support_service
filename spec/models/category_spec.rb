require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Category, type: :model do
  it { should validate_presence_of(:name) }
  
  it { should have_many(:categories_stores) }
  it { should have_many(:stores).through(:categories_stores) }
end
