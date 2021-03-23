class Api::V1::VehiclesController < Api::GenericController

  private

  def filter(resources)
    resources = resources.by_model(params[:model_name]) if params[:model_name].present?
    resources = resources.by_brand(params[:brand_name]) if params[:brand_name].present?
    resources = resources.by_year(params[:year]) if params[:year].present?
    resources = resources.by_mileage(params[:mileage]) if params[:mileage].present?
    resources = resources.by_price(params[:price]) if params[:price].present?
    resources
  end

  def permitted_params
    params.permit([:brand, :model, :year, :price, :mileage])
  end
end
