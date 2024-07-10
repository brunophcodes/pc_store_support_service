class Store < ApplicationRecord
  validates :name ,:address, presence: true
end
