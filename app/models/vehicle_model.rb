class VehicleModel < ApplicationRecord

  attr_accessor :brand

  belongs_to :vehicle_brand

  before_validation :set_brand

  validates :name, uniqueness: true
  validates_presence_of :name, :vehicle_brand_id

  scope :by_brand, ->(brand_name) { joins(:vehicle_brand).where(vehicle_brands: { name: brand_name }) }

  private

  def set_brand
    _brand = brand.is_a?(VehicleBrand) ? brand : VehicleBrand.find_or_create_by(name: brand)
    self.vehicle_brand = _brand
  end

end
