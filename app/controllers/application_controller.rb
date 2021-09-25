# frozen_string_literal: true

require 'application_responder'

# Application controller sets custom responder, defines shared utility for rendering response
class ApplicationController < ActionController::API
  self.responder = ApplicationResponder
  respond_to :html

  respond_to :json

  def render_jsonapi_response(resource)
    errors = resource.errors
    if errors.empty?
      render jsonapi: resource
    else
      render jsonapi_errors: errors, status: :bad_request
    end
  end
end
