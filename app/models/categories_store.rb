class CategoriesStore < ApplicationRecord
  belongs_to :category
  belongs_to :store
end
