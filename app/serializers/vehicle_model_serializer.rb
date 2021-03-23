class VehicleModelSerializer < ActiveModel::Serializer
  attributes :id, :name, :brand

  def brand
    object.vehicle_brand&.name
  end
end
