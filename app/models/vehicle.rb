class Vehicle < ApplicationRecord
  attr_accessor :brand, :model

  belongs_to :vehicle_model

  before_validation :set_model

  validates_presence_of :year, :price

  scope :by_model, ->(model_name){ joins(:vehicle_model).where(vehicle_models: { name: model_name }) }
  scope :by_brand, ->(brand_name){ joins(vehicle_model: :vehicle_brand).where(vehicle_brands: { name: brand_name }) }
  scope :by_year, ->(_year){ where('year >= ?', _year) }
  scope :by_mileage, ->(_mileage){ where('mileage <= ?', _mileage) }
  scope :by_price, ->(_price){ where('price <= ?', _price)}

  private

  def set_model
    self.vehicle_model = VehicleModel.by_brand(brand).find_by(name: model)
  end

end
