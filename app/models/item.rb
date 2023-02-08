class Item < ApplicationRecord
  belong_to :genre
  has_many :cart_items, dependent: :destroy
end
