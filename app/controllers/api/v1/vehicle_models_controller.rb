class Api::V1::VehicleModelsController < Api::GenericController

  private

  def filter(resources)
    resources = resources.by_brand(params[:brand_name]) if params[:brand_name].present?
    resources
  end

  def permitted_params
    params.permit([:name, :brand])
  end
end
