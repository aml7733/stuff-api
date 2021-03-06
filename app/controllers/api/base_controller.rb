# frozen_string_literal: true

module Api
  # BaseController inherits from rails, adds basic shared utility and is
  class BaseController < ApplicationController
    before_action :authenticate_user!

    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def not_found
      render json: {
        errors: [
          {
            status: '404',
            title: 'Not Found'
          }
        ]
      }, status: :not_found
    end
  end
end
