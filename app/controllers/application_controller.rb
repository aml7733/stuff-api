# frozen_string_literal: true

require 'application_responder'

class ApplicationController < ActionController::API
  self.responder = ApplicationResponder
  respond_to :html

  respond_to :json

  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render jsonapi: resource
    else
      render jsonapi_errors: resource.errors, status: :bad_request
    end
  end
end
