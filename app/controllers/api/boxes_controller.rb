# frozen_string_literal: true

module Api
  # Controller for boxes, uses Devise jwt auth from BaseController
  class BoxesController < BaseController
    before_action :set_box, only: %i[show update destroy]

    respond_to :json

    # GET /api/boxes
    def index
      @boxes = Box.all
      render json: @boxes, status: :ok
    end

    # GET /api/boxes/1
    def show
      render json: @box, status: :ok
    end

    # POST api/boxes
    def create
      @box = Box.new(box_params)
      if @box.save
        render json: @box, status: :created
      else
        render json: @box.errors, status: :unprocessable_entity
      end
    end

    # PATCH /api/box/1
    def update
      if @box.update(box_params)
        render json: @box, status: :ok
      else
        render json: @box.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/box/1
    def destroy
      if @box.destroy
        render json: @box, status: :no_content
      else
        render json: @box.errors, status: :unprocessable_entity
      end
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
