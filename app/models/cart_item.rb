class CartItem < ApplicationRecord
  belong_to :item
  belong_to :customer
end
