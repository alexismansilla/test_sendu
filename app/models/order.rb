class Order < ApplicationRecord
  belongs_to :user
  has_many :order_item
  has_many :products, through: :order_item

  scope :high_value, -> {
    select('orders.*, SUM(order_items.quantity * products.price) AS calculated_total_amount')
      .joins(order_item: :products)
      .group('orders.id')
      .having('SUM(order_items.quantity * products.price) > 500')
  }

  def total_amount 
    order_item.includes(:product).sum { |item| item.product.price * item.quantity }
  end
end
