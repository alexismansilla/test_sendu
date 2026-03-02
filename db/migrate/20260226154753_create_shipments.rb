class CreateShipments < ActiveRecord::Migration[5.2]
  def change
    create_table :shipments do |t|
      t.string :tracking_number
      t.integer :status, default: 0
      t.string :carrier_name
      t.string :origin_city

      t.timestamps
    end
  end
end
