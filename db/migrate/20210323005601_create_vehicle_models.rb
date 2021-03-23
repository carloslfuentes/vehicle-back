class CreateVehicleModels < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicle_models do |t|
      t.references :vehicle_brand
      t.string :name
      t.timestamps
    end
  end
end
