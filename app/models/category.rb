class Category < ApplicationRecord
    has_many :categories_stores
    has_many :stores, through: :categories_stores
    
    validates :name, presence: true
end