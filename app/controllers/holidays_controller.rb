class HolidaysController < ApplicationController

  def index
    @holiday = Holiday.new
    @holidays = Holiday.all
  end

  def create
    @holiday = Holiday.new(holiday_params)
    if @holiday.save

      redirect_to holidays_path
    else
      render :index
    end
  end

  def show
    @holiday = Holiday.find(params[:id])
  end

  def edit
    @holiday = Holiday.find(params[:id])
  end

  def update
    @holiday = Holiday.find(params[:id])
    @holiday.update_attributes!(holiday_params)

    redirect_to holidays_path
  end

  private
  def holiday_params
    params.require(:holiday).permit(:name, :celebrate)
  end
end