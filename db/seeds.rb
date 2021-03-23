# Vehicle Brands
["VW", "Chevrolet", "Nissan"].each do |name|
  VehicleBrand.create(name: name)
end

# VehicleModels
brand = VehicleBrand.find_by(name: "VW")
[
  {
    brand: brand,
    name: "JETTA",
  },
  {
    brand: brand,
    name: "POLLO",
  },
  {
    brand: brand,
    name: "GOLF",
  },
  {
    brand: brand,
    name: "UP",
  },
].each do |vehicle_model|
  VehicleModel.create(vehicle_model)
end

brand = VehicleBrand.find_by(name: "Chevrolet")
[
  {
    brand: brand,
    name: "TRAILBLAZER",
  },
  {
    brand: brand,
    name: "SONIC",
  },
  {
    brand: brand,
    name: "BOLT",
  },
  {
    brand: brand,
    name: "BLAZER",
  },
].each do |vehicle_model|
  VehicleModel.create(vehicle_model)
end
brand = VehicleBrand.find_by(name: "Nissan")
[
  {
    brand: brand,
    name: "KICKS",
  },
  {
    brand: brand,
    name: "SENTRA",
  },
  {
    brand: brand,
    name: "VERSA",
  },
  {
    brand: brand,
    name: "MURANO",
  },
].each do |vehicle_model|
  VehicleModel.create(vehicle_model)
end
