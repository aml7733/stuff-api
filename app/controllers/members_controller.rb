# frozen_string_literal: true

# Placeholder from following devise jwt tutorial
class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: { message: "If you see this, you're in!" }
  end
end
