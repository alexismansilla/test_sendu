class Package < ApplicationRecord
    belongs_to :shipment

    validates :weight, presence: true, numericality: { greater_than: 0 }
end
