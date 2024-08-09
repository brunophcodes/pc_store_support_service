require 'rails_helper'

RSpec.describe CategoriesStore, type: :model do
  it { should belong_to(:category) } 
  it { should belong_to(:store) }
end
