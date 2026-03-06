class Shipment < ApplicationRecord
  enum status: { pending: 0, in_transit: 1, delivered: 2 }

  before_save :titleize_name  

  has_many :packages

  validates :tracking_number, presence: true, uniqueness: true 
  validates :carrier_name, presence: true

  scope :pending_shipments, -> { where(status: :pending) }
  scope :by_carrier, ->(carrier_name) { where(carrier_name: carrier_name.upcase) }

  def total_weight
    @total_weight ||= packages.sum(:weight)
  end

  private

  def titleize_name
    self.carrier_name = carrier_name.upcase  if carrier_name.present?
  end
end
