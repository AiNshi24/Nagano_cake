class CartItem < ApplicationRecord
  has_one_attached :image
  belongs_to :item
  belongs_to :customer
end
