class Shipment < ApplicationRecord
  enum status: { pending: 0, in_transit: 1, delivered: 2 }

  has_many :packages

  def total_weight
    @total_weight ||= packages.sum(:weight)
  end
end
