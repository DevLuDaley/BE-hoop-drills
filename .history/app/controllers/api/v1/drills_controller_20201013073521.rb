# frozen_string_literal: true

class Api::V1::DrillsController < ApplicationController
  # before_action :find_drill, only: [:update]
  def index
    @drills = Drill.all.order(:created_at)
    render json: @drills, status: 200
  end

  def create
    @drill = Drill.create(drill_params)
    render json: @drill, status: 201
  end

  def destroy
    drill = Drill.find(params[:id])
    render json: { drillId: drill.id }, status: 200 if drill.destroy
  end

  def update
    @drill = Drill.find(params[:id])
    # if @drill.update(drill_params)
    #   render json: @drill, status: 200

    #  @drill.update(drill_params)
    if @drill.save
      render json: @drill, status: :accepted
    else
      render json: { errors: @drill.errors.full_messages }, status: :unprocessible_entity
      # end
    end
  end

  private

  def drill_params
    params.require(:drill).permit(:type, :name, :duration, :distance)
  end

  #   def drill_params
  #     params.permit(:title, :content)
  #   end

  #   def find_drill
  #     @drill = Drill.find(params[:id])
  #   end
end
