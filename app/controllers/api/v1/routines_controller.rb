class Api::V1::RoutinesController < ApplicationController
# before_action :find_routine, only: [:update]
  def index
    @routines = Routine.all.order(:created_at)
    render json: @routines, status: 200
  end

  def create
    @routine = Routine.create(routine_params)
    render json: @routine, status: 201
  end

  def destroy
    routine = Routine.find(params[:id])
    if routine.destroy
      render json: {routineId: routine.id}, status: 200
    end
  end

  def update
    @routine = Routine.find(params[:id])
    # if @routine.update(routine_params)
    #   render json: @routine, status: 200


#  @routine.update(routine_params)
    if @routine.save
      render json: @routine, status: :accepted
    else
      render json: { errors: @routine.errors.full_messages }, status: :unprocessible_entity
    # end
    end
  end

  private
    def routine_params
      params.require(:routine).permit(:type, :name, :duration, :distance)
    end