class Store < ApplicationRecord
  has_many :categories_stores
  has_many :categories, through: :categories_stores

  validates :name ,:address, presence: true
end
