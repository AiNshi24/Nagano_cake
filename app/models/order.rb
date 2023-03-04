class Order < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4 }
  
  def order_item_count
    count = 0
    order_details.each do |order_detail|
      count += order_detail.amount
    end
    return count
  end

  def order_item_price
    total = 0
    order_details.each do |order_detail|
      total += order_detail.price*order_detail.amount
    end
    return total
  end

end
