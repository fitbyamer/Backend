class WorkoutsController < ApplicationController

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new workout_params
    if @workout.save
      redirect_to workout_path(id: @workout.id)
    else
      render action: :new
    end
  end

  def edit
    @workout = Workout.find params[:id]
  end

  def update
    @workout = Workout.find params[:id]
    if @workout.update workout_params
      redirect_to workout_path(id: @workout.id)
    else
      render action: :edit
    end
  end

  def index
    @workouts = Workout.order(created_at: :desc).paginate page: params[:page]
  end

  def destroy
  end

  def show
    @workout = Workout.find params[:id]
  end

  private

  def workout_params
    params.require(:workout).permit(:title, :media, :category, :main_muscle_worked, :equipment, :guide)
  end
end
