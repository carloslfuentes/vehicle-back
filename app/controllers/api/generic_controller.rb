class Api::GenericController < ApplicationController
  SUCCESS_STATUS = { create: 201 }.with_indifferent_access

  def create
    @object = object.new(permitted_params)
    @object.save
    render_resource(@object)
  end

  def show
    render_resource(@object)
  end

  def index
    @objects = filter(object.all)
    render_resources(@objects)
  end

  private

  def filter(resources)
    resources
  end

  def success_status
    SUCCESS_STATUS[params[:action]] || 200
  end

  def serializer_class
    "#{object_name}Serializer".constantize
  end

  def object_name
    controller_name.classify
  end

  def object
    object_name.constantize
  end

  def render_resources(resources)
    render json: resources, each_serializer: serializer_class, status: success_status, meta: true, meta_key: :success
  end

  def render_single_resource(resource)
    render json: resource, serializer: serializer_class, status: success_status, meta: true, meta_key: :success
  end

  def validation_error(resource: object, status_code: 400, title: '', code: 100)
    errors = {
      error: {
        title: title,
        status: status_code,
        detail: resource.errors,
        summary: resource.try(:service_process_summary),
        code: code
      },
      success: false
    }
    render json: errors, status: status_code
  end

  def render_resource(resource)
    if resource.errors.empty? && params[:action] != :index
      render_single_resource(resource)
    elsif resource.errors.empty?
      render_resources(resource)
    else
      validation_error(resource: resource, status_code: 400, title: resource&.class&.name&.downcase)
    end
  end

end
