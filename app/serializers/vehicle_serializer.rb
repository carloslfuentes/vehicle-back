class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :model_name, :brand_name, :year, :mileage, :price

  def model_name
    object.vehicle_model&.name
  end

  def brand_name
    object.vehicle_model&.vehicle_brand.name
  end

end
