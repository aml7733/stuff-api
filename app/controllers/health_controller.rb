# frozen_string_literal: true

# Simple Health Check to see if application is up
class HealthController < ApplicationController
  def index
    render json: { status: 'online' }, status: :ok
  end
end
