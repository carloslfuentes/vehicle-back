class Api::V1::VehicleModelsController < Api::GenericController

  private

  def permitted_params
    params.permit([:name, :brand])
  end
end
