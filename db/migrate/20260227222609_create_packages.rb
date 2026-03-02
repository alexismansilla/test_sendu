class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.decimal :weight
      t.string :description
      t.references :shipment, foreign_key: true

      t.timestamps
    end
  end
end
