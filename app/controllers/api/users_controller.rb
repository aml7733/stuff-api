# frozen_string_literal: true

module Api
  # Users controller adds basic CRUD functionality, only show for now
  class UsersController < Api::BaseController
    before_action :find_user, only: %w[show]

    def show
      render_jsonapi_response(user)
    end

    private

    def find_user
      @user = User.find(params[:id])
    end

    attr_accessor :user
  end
end
