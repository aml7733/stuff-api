# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    begin
      resource.save
      sign_up(resource_name, resource) if resource.persisted?
      render_jsonapi_response(resource)
    rescue ActiveRecord::RecordNotUnique
      render jsonapi_errors: resource.errors.full_messages, status: :unprocessable_entity
    end
  end
end
