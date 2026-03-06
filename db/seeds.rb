Package.delete_all
Shipment.delete_all

s1 = Shipment.create!(
    tracking_number: "123456789",
    status: "pending",
    carrier_name: "UPS",
    origin_city: "New York"
)

s2 = Shipment.create!(
    tracking_number: "223456789",
    status: "in_transit",
    carrier_name: "UPS",
    origin_city: "New York"
)

s3 = Shipment.create!(
    tracking_number: "323456789",
    status: "delivered",
    carrier_name: "UPS",
    origin_city: "New York"
)

s4 = Shipment.create!(
    tracking_number: "423456789",
    status: "pending",
    carrier_name: "FedEx",
    origin_city: "Los Angeles"
)

s5 = Shipment.create!(
    tracking_number: "523456789",
    status: "in_transit",
    carrier_name: "FedEx",
    origin_city: "Los Angeles"
)

Package.create!(
    weight: 10,
    description: "Package 1",
    shipment_id: s1.id
)

Package.create!(
    weight: 20,
    description: "Package 2",
    shipment_id: s1.id
)

Package.create!(
    weight: 30,
    description: "Package 3",
    shipment_id: s2.id
)

Package.create!(
    weight: 40,
    description: "Package 4",
    shipment_id: s2.id
)

Package.create!(
    weight: 50,
    description: "Package 5",
    shipment_id: s3.id
)

Package.create!(
    weight: 60,
    description: "Package 6",
    shipment_id: s3.id
)

Package.create!(
    weight: 70,
    description: "Package 7",
    shipment_id: s4.id
)

Package.create!(
    weight: 80,
    description: "Package 8",
    shipment_id: s4.id
)

Package.create!(
    weight: 90,
    description: "Package 9",
    shipment_id: s5.id
)

Package.create!(
    weight: 100,
    description: "Package 10",
    shipment_id: s5.id
)