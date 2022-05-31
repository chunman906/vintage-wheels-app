class CarsController < ApplicationController
  def index
    @cars = Car.all
    if params[:search]
      @cars = @cars.where("location ILIKE ?", "%#{params[:search][:query]}%")
    end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.save
    redirect_to car_path(@car)
  end

  def show
    @car = Car.find(params[:id])
  end

private
  def car_params
    params.require(:car).permit(:mode, :year, :brand, :price, :features, :color, :location, :description, :users_id, :photo_url)
  end
end
