class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.references :vehicle_model
      t.integer   :year
      t.integer :mileage
      t.integer :price
      t.timestamps
    end
  end
end
