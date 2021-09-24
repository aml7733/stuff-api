# frozen_string_literal: true

module Api
  # Controller for boxes, uses Devise jwt auth from BaseController
  class BoxesController < BaseController
    before_action :set_box, only: %i[show update destroy]

    respond_to :json

    def index
      @boxes = Box.all
      respond_with(@boxes)
    end

    def show
      respond_with(@box)
    end

    def create
      @box = Box.new(box_params)
      @box.save
      respond_with(@box)
    end

    def update
      @box.update(box_params)
      respond_with(@box)
    end

    def destroy
      @box.destroy
      respond_with(@box)
    end

    private

    def set_box
      @box = Box.find(params[:id])
    end

    def box_params
      params.require(:box).permit(:name, :description)
    end
  end
end
