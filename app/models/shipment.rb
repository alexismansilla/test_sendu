class Shipment < ApplicationRecord
    enum status: { pending: 0, in_transit: 1, delivered: 2 }

    has_many :packages

    validates :tracking_number, presence: true, uniqueness: true
    validates :carrier_name, presence: true

    before_save { carrier_name&.upcase! }

    scope :pending_shipments, -> { where(status: 'pending') }
    scope :by_carrier, ->(name) { where(carrier_name: name) }

    def total_weight
        packages.sum(:weight)
    end
end
