class Item < ApplicationRecord
  belong_to :genre
  has_many :add, dependent: :destroy
end
